require "minitest/autorun"

require_relative "../../config/application"

class RubyshowLegacyDefaultsTest < Minitest::Test
  def test_keeps_rails_7_1_defaults_on_rails_8
    assert_equal 7.1, Rubyshow::Application.config.loaded_config_version
  end
end
