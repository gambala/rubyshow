lint-ruby-setup:
	rubocop --auto-gen-config

lint-ruby:
	rubocop -a

lint-security:
	brakeman

start:
	overmind start
