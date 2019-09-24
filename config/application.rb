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
    config.app.firebase.storage = OpenStruct.new
    config.app.firebase.firestore = OpenStruct.new
    config.app.firebase.api_key = Rails.application.credentials[:firebase][:api_key]
    config.app.firebase.storage.bucket = Rails.application.credentials[:storage][:bucket]
    config.app.firebase.firestore.project_id = Rails.application.credentials[:firestore][:project_id]

    config.app.assets.images = 'app/assets/images/'.freeze
    config.app.assets.js_prefix = 'app/assets/javascripts/'.freeze
    config.app.assets.style_prefix = 'app/assets/stylesheets/'.freeze
  end
end

Google::Cloud::Storage.configure do |config|
  config.project_id  = Rails.application.config.app.firebase.firestore.project_id
  config.credentials = "/var/www/html/voyce/config/voyce-keyfile.json"
end

Google::Cloud::Firestore.configure do |config|
  config.project_id  = Rails.application.config.app.firebase.firestore.project_id
  config.credentials = "/var/www/html/voyce/config/voyce-adminsdk.json"
end