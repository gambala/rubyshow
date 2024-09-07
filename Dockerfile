# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.5
FROM ruby:$RUBY_VERSION-alpine AS base

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test" \
    RAILS_ENV="production"

# Install packages
RUN apk add --no-cache tzdata

# Update gems and bundler
RUN gem update --system --no-document && \
    gem install -N bundler && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git node_modules/.cache


# Throw-away build stages to reduce size of final image
FROM base AS prebuild

# Install packages needed to build gems and assets
# - build-base: for compiling native extensions
# - git: for installing gems from git repositories
# - gcompat: for running gnu-based gems (nokogiri)
# - nodejs: for vite
# - npm: for pnpm
# - pnpm: for installing node modules
RUN apk add --no-cache build-base git gcompat nodejs npm && \
    npm install -g pnpm


FROM prebuild AS node_modules_build

# Install node modules
COPY --link package.json pnpm-lock.yaml ./
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile


FROM prebuild AS node_modules_production

# Install node modules for production
COPY --link package.json pnpm-lock.yaml ./
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile --prod


FROM prebuild AS build

# Install application gems
COPY --link Gemfile Gemfile.lock ./
RUN bundle install && \
    bundle exec bootsnap precompile --gemfile && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copy node modules & application code
COPY --from=node_modules_build /rails/node_modules /rails/node_modules
COPY --link . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production
RUN pnpm run build

# Remove build-related node_modules to reduce image size
RUN rm -rf node_modules

COPY --from=node_modules_production /rails/node_modules /rails/node_modules


# Final stage for app image
FROM base

# Install packages needed for deployment
RUN apk add --no-cache curl jemalloc gcompat

# Copy built artifacts: gems, application
COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# Run and own only the runtime files as a non-root user for security
ARG UID=1000 \
    GID=1000
RUN addgroup --system --gid $GID rails && \
    adduser --system rails --uid $UID --ingroup rails --home /home/rails --shell /bin/sh rails && \
    chown -R rails:rails db log storage tmp
USER rails:rails

# Deployment options
ENV LD_PRELOAD="libjemalloc.so.2" \
    MALLOC_CONF="dirty_decay_ms:1000,narenas:2,background_thread:true" \
    RUBY_YJIT_ENABLE="1"

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
