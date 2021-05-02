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



lint-js:
	./node_modules/.bin/eslint frontend --fix

lint-ruby-setup:
	bundle exec rubocop --auto-gen-config

lint-ruby:
	bundle exec rubocop -a

lint-security:
	brakeman



run-bundle-install:
	MAKE="make --jobs 8" bundle install

run-bundle-update:
	MAKE="make --jobs 8" gem_update

run-command:
	$(RUN_ARGS)

run-console:
	bundle exec rails console

run-frontend-update:
	yarn upgrade-interactive --latest

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

g: run-generate

s: run-rails
