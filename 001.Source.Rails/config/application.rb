require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pt
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Seoul'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.i18n.default_locale = :ko
    config.i18n.enforce_available_locales = false

    config.encoding = "UTF-8"

    config.autoload_paths += %W(#{config.root}/lib)
                                config.autoload_paths += Dir["#{config.root}/lib/**/"]
                                config.autoload_paths += Dir["#{config.root}/app/**/**"]
                                end
                                end
