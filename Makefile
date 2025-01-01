# https://stackoverflow.com/a/14061796/2237879
#
# This hack allows you to run make commands with any set of arguments.
#
# For example, these lines are the same:
#   > make g devise:install
#   > bundle exec rails generate devise:install
# And these:
#   > make add-migration add_deleted_at_to_users deleted_at:datetime
#   > bundle exec rails g migration add_deleted_at_to_users deleted_at:datetime
# And these:
#   > make add-model Order user:references record:references{polymorphic}
#   > bundle exec rails g model Order user:references record:references{polymorphic}
#
RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
CONTAINER_NAME=ghcr.io/gambala/rubyshow
PORT=3000
ID_FILE=.container_id

.PHONY: test



add-migration:
	bundle exec rails g migration $(RUN_ARGS)

add-model:
	bundle exec rails g model $(RUN_ARGS)



db-create:
	bundle exec rake db:create

db-migrate:
	bundle exec rake db:migrate

db-rollback:
	bundle exec rake db:rollback



docker-build:
	docker build -t $(CONTAINER_NAME) .

docker-run:
	@echo "Running Docker container..."
	@docker run -dp $(PORT):$(PORT) $(CONTAINER_NAME) > $(ID_FILE)
	@echo "Container started: $$(cat $(ID_FILE))"

docker-stop:
	@if [ -f $(ID_FILE) ]; then \
		CONTAINER_ID=$$(cat $(ID_FILE)); \
		echo "Stopping Docker container: $$CONTAINER_ID"; \
		docker stop $$CONTAINER_ID; \
		rm $(ID_FILE); \
		echo "Container stopped."; \
	else \
		echo "No container ID file found. Is the container running?"; \
	fi



lint-js:
	./node_modules/.bin/eslint frontend --fix

lint-ruby-unsafe:
	bundle exec standardrb --fix-unsafely

lint-ruby:
	bundle exec standardrb --fix

lint-security:
	brakeman



run-bundle-install:
	MAKE="make --jobs 8" bundle install

run-bundle-update-setup:
	gem install bundle_update_interactive

run-bundle-update:
	bundle ui

run-command:
	$(RUN_ARGS)

run-console:
	bundle exec rails console

run-frontend-update:
	pnpm update --interactive --latest

run-frontend-upgrade:
	pnpm update

run-generate:
	bundle exec rails generate $(RUN_ARGS)

run-rails:
	bundle exec puma -t 1:1 -b tcp://0.0.0.0:3000

run-sidekiq:
	bundle exec sidekiq -q critical,9 -q default,5 -q low,1



test:
	rails test



bi: run-bundle-install

bu: run-bundle-update

c: run-console

fu: run-frontend-update

fuu: run-frontend-upgrade

g: run-generate

s:
	bin/dev
