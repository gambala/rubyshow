# frozen_string_literal: true

Rails.application.config.assets.paths += [
  Rails.root.join('node_modules'),
  Pagy.root.join('javascripts'),
]
Rails.application.config.assets.precompile += %w()
Rails.application.config.assets.version = '1.0'
