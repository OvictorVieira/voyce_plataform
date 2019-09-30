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
    config.app.heroku = OpenStruct.new
    config.app.assets = OpenStruct.new
    config.app.firebase = OpenStruct.new
    config.app.heroku.postgres = OpenStruct.new
    config.app.firebase.storage = OpenStruct.new
    config.app.firebase.firestore = OpenStruct.new
    config.app.firebase.api_key = Rails.application.credentials[:firebase][:api_key]
    config.app.firebase.storage.bucket = Rails.application.credentials[:firebase][:storage][:bucket]
    config.app.firebase.firestore.project_id = Rails.application.credentials[:firebase][:firestore][:project_id]

    config.app.heroku.postgres.user = Rails.application.credentials[:database][:user]
    config.app.heroku.postgres.host = Rails.application.credentials[:database][:host]
    config.app.heroku.postgres.user = Rails.application.credentials[:database][:user]
    config.app.heroku.postgres.database = Rails.application.credentials[:database][:database]
    config.app.heroku.postgres.password = Rails.application.credentials[:database][:password]

    config.app.assets.images = 'app/assets/images/'.freeze
    config.app.assets.js_prefix = 'app/assets/javascripts/'.freeze
    config.app.assets.style_prefix = 'app/assets/stylesheets/'.freeze
  end
end

Google::Cloud::Storage.configure do |config|
  config.project_id  = Rails.application.config.app.firebase.firestore.project_id
  config.credentials = Rails.application.credentials[:firebase][Rails.env.to_sym][:storage_keyfile_path]
end

Google::Cloud::Firestore.configure do |config|
  config.project_id  = Rails.application.config.app.firebase.firestore.project_id
  config.credentials = Rails.application.credentials[:firebase][Rails.env.to_sym][:firestore_keyfile_path]
end
