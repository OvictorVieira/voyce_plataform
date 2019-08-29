require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Voyce
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.locale = 'pt-BR'
    config.i18n.default_locale = 'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**','*.{rb,yml}').to_s]

    config.app = OpenStruct.new
    config.app.assets = OpenStruct.new
    config.app.firebase = OpenStruct.new
    config.app.firebase.project_id = OpenStruct.new
    config.app.firebase.private_key = File.open("#{Rails.root}/config/voyce-firebase.json").read
    config.app.assets.js_prefix = 'app/assets/javascripts/'.freeze
    config.app.assets.style_prefix = 'app/assets/stylesheets/'.freeze
  end
end
