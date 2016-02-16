ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

# Используем webkit в качестве движка javascript в тестах capybara
Capybara.javascript_driver = :webkit

# блокируем неизвестные url
Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  # Подключаем синтаксис FactoryGirl в тесты
  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL
  # Подключаем хелперы url в тесты
  config.include Rails.application.routes.url_helpers

  config.before(:all) { FactoryGirl.reload }

  # Очищаем базу данных перед и после тестов
  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end
