require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module NvimBuilder
  class Application < Rails::Application
    config.autoload_paths << "#{root}/app/views"
    config.autoload_paths << "#{root}/app/views/layouts"
    config.autoload_paths << "#{root}/app/views/components"
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
  end
end
