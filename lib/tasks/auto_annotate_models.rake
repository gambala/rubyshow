# frozen_string_literal: true

if Rails.env.development?
  require 'annotate'
  task set_annotation_options: :environment do
    Annotate.set_defaults(
      'routes'                     => 'false',
      'models'                     => 'true',
      'position_in_routes'         => 'after',
      'position_in_class'          => 'after',
      'position_in_test'           => 'after',
      'position_in_fixture'        => 'after',
      'position_in_factory'        => 'after',
      'position_in_serializer'     => 'after',
      'show_foreign_keys'          => 'false',
      'show_complete_foreign_keys' => 'false',
      'show_indexes'               => 'true',
      'simple_indexes'             => 'false',
      'model_dir'                  => 'app/models',
      'root_dir'                   => '',
      'include_version'            => 'false',
      'require'                    => '',
      'exclude_tests'              => 'false',
      'exclude_fixtures'           => 'false',
      'exclude_factories'          => 'false',
      'exclude_serializers'        => 'false',
      'exclude_scaffolds'          => 'true',
      'exclude_controllers'        => 'true',
      'exclude_helpers'            => 'true',
      'exclude_sti_subclasses'     => 'true',
      'ignore_model_sub_dir'       => 'false',
      'ignore_columns'             => nil,
      'ignore_routes'              => nil,
      'ignore_unknown_models'      => 'false',
      'hide_limit_column_types'    => 'integer,boolean',
      'hide_default_column_types'  => 'json,jsonb,hstore',
      'skip_on_db_migrate'         => 'false',
      'format_bare'                => 'true',
      'format_rdoc'                => 'false',
      'format_markdown'            => 'false',
      'sort'                       => 'false',
      'force'                      => 'false',
      'trace'                      => 'false',
      'wrapper_open'               => nil,
      'wrapper_close'              => nil,
      'with_comment'               => true,
    )
  end

  Annotate.load_tasks
end
