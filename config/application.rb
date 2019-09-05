require_relative 'boot'

require 'rails/all'
require 'google/cloud/firestore'
require "google/cloud/storage"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Voyce
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.i18n.locale = 'pt-BR'
    config.i18n.default_locale = 'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**','*.{rb,yml}').to_s]
    config.assets.paths << Rails.root.join("app", "assets", "img")

    config.app = OpenStruct.new
    config.app.assets = OpenStruct.new
    config.app.firebase = OpenStruct.new
    config.app.firebase.firestore = OpenStruct.new
    config.app.firebase.firestore.api_key = Rails.application.credentials[:firestore][:api_key]
    config.app.firebase.firestore.credentials = Rails.application.credentials[:firestore][:secret_data]
    config.app.firebase.firestore.project_id = Rails.application.credentials[:firestore][:secret_data][:project_id]
    config.app.assets.images = 'app/assets/images/'.freeze
    config.app.assets.js_prefix = 'app/assets/javascripts/'.freeze
    config.app.assets.style_prefix = 'app/assets/stylesheets/'.freeze
  end
end