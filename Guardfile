# frozen_string_literal: true

interactor :simple

guard :bundler do
  watch('Gemfile')
end

guard :livereload do
  watch(%r{app/views/.+.(erb|slim)$})
  watch(%r{app/helpers/.+.rb})
  watch(%r{app/assets/.+.yml})
  watch(%r{public/.+.(css|js|html)})
  watch(%r{config/locales/.+.yml})
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(sass))).*}) do |m|
    "/assets/#{m[3].sub!('.sass', '.css')}"
  end
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(coffee))).*}) do |m|
    "/assets/#{m[3].sub!('.coffee', '.js')}"
  end
end

guard :rspec, cmd: 'spring rspec --color --format progress --fail-fast',
              all_after_pass: false, all_on_start: false, parallel: true, failed_mode: :keep do
  watch(%r{^spec/.+_spec.rb$})
  watch(%r{^lib/(.+).rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')                       { 'spec' }

  watch(%r{^app/(.+).rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(.erb|.slim)$})                  { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller).rb$}) do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb"]
  end
  watch(%r{^spec/support/(.+).rb$})                  { 'spec' }
  watch('config/routes.rb')                          { 'spec/routing' }
  watch('application_controller.rb')                 { 'spec/controllers' }

  watch(%r{^app/views/(.+)/.*.(erb|slim)$})          { |m| "spec/features/#{m[1]}_spec.rb" }
end
