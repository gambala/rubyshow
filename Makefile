console:
	bundle exec rails console

lint-ruby-setup:
	bundle exec rubocop --auto-gen-config

lint-ruby:
	bundle exec rubocop -a

lint-security:
	brakeman

start:
	bundle exec puma -t 1:1 -b tcp://0.0.0.0:3000
# 	bundle exec falcon serve -b http://localhost:3000

watch:
	overmind start

s: start
