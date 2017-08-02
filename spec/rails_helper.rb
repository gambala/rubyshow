# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'devise'
require_relative 'support/devise_request_spec_helpers.rb'
require 'factory_girl_rails'
require 'shoulda/matchers'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :webkit
Capybara::Webkit.configure(&:block_unknown_urls)

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include DeviseRequestSpecHelpers, type: :request
  config.include Rails.application.routes.url_helpers

  config.before(:all) { FactoryGirl.reload }

  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end
