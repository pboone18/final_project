require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookreviews
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    #Autoload Goodreads modules in library directory
    # config.autoload_paths += Dir["bookreviews/lib/client"]

# Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.before_configuration do
        env_file = File.join(Rails.root, 'config', 'local_env.yml')
        YAML.load(File.open(env_file)).each do |key, value|
            ENV[key.to_s] = value
        end if File.exists?(env_file)
    end

#     unless Rails.env == 'production'
#   require 'yaml'
#   rails_root = Rails.root || File.dirname(__FILE__) + '/../..'
#   config = YAML.load_file(rails_root.to_s + "/config/env_vars.yml")
#   if config.key?(Rails.env) && config[Rails.env].is_a?(Hash)
#     config[Rails.env].each do |key, value|
#       ENV[key] = value.to_s
#     end
#   end
# end
    

  end
end
