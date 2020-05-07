# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'

  config.authentication_keys = [:login]
  config.case_insensitive_keys = [:email]
  config.confirmation_keys = [:username]
  config.expire_all_remember_me_on_sign_out = true
  config.mailer_sender = 'noreply@rubycourses.ru'
  config.omniauth :github, ENV['github_key'], ENV['github_secret'], scope: 'user:email'
  config.password_length = 8..72
  config.reconfirmable = false
  config.reset_password_keys = [:username]
  config.reset_password_within = 6.hours
  config.secret_key = ENV['devise_secret']
  config.sign_out_via = :delete
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.strip_whitespace_keys = [:email]

  # config.allow_unconfirmed_access_for = 2.days
  # config.clean_up_csrf_token_on_authentication = true
  # config.confirm_within = 3.days
  # config.confirmation_keys = [:email]
  # config.default_scope = :user
  # config.email_regexp = /\A[^@]+@[^@]+\z/
  # config.encryptor = :sha512
  # config.extend_remember_period = false
  # config.http_authenticatable = false
  # config.http_authenticatable_on_xhr = true
  # config.http_authentication_realm = 'Application'
  # config.last_attempt_warning = true
  # config.lock_strategy = :failed_attempts
  # config.mailer = 'Devise::Mailer'
  # config.maximum_attempts = 20
  # config.navigational_formats = ['*/*', :html]
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
  # config.omniauth_path_prefix = '/my_engine/users/auth'
  # config.params_authenticatable = true
  # config.paranoid = true
  # config.pepper = 'rake secret'
  # config.remember_for = 2.weeks
  # config.rememberable_options = {}
  # config.request_keys = []
  # config.reset_password_keys = [:email]
  # config.router_name = :my_engine
  # config.scoped_views = false
  # config.send_password_change_notification = false
  # config.sign_in_after_reset_password = true
  # config.sign_out_all_scopes = true
  # config.timeout_in = 30.minutes
  # config.unlock_in = 1.hour
  # config.unlock_keys = [:email]
  # config.unlock_strategy = :both
  # mount MyEngine, at: '/my_engine'

  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end
end
