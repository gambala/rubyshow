# frozen_string_literal: true

module HeroiconHelper
  include Heroicon::Engine.helpers

  def hicon(name, *args)
    options = args.extract_options!
    heroicon name, options: options
  end
end
