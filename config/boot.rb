# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup'
require 'bootsnap'

Bootsnap.setup(
  cache_dir:            'tmp/cache',
  development_mode:     ENV['MY_ENV'] == 'development',
  load_path_cache:      true,
  autoload_paths_cache: true,
  disable_trace:        false,
  compile_cache_iseq:   false,
  compile_cache_yaml:   false
)
