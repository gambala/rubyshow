lint-ruby-setup:
	bundle exec rubocop --auto-gen-config

lint-ruby:
	bundle exec rubocop -a

lint-security:
	brakeman

start:
	overmind start

watch:
	overmind start
