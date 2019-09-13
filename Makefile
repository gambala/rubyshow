console:
	bundle exec rails console

lint-ruby-setup:
	bundle exec rubocop --auto-gen-config

lint-ruby:
	bundle exec rubocop -a

lint-security:
	brakeman

start:
	bundle exec rails s

watch:
	overmind start

s: start
