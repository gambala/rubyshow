# frozen_string_literal: true

additional_paths = [Rails.root.join('node_modules')]

Rails.application.config.assets.paths += additional_paths
Rails.application.config.assets.precompile += %w()
Rails.application.config.assets.version = '1.0'
