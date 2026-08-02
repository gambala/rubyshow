ENV["RAILS_ENV"] ||= "test"

require "minitest/autorun"
require_relative "../../config/application"
require_relative "../../config/initializers/session_store"
require_relative "../../config/environments/test"

class RubyshowRuntimeContractTest < Minitest::Test
  def test_keeps_the_cookie_session_contract
    assert_equal ActionDispatch::Session::CookieStore, Rails.application.config.session_store
    assert_equal "_rubyshow_session", Rails.application.config.session_options[:key]
    assert_nil Rails.application.config.session_options[:expire_after]
  end

  def test_uses_test_mail_delivery
    assert_equal :test, Rails.application.config.action_mailer.delivery_method
  end
end
