# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

js_prefix = Rails.application.config.app.assets.js_prefix
style_prefix = Rails.application.config.app.assets.style_prefix
images_prefix = Rails.application.config.app.assets.images

javascripts = Dir["#{js_prefix}**/*.js"].map { |x| x.gsub(js_prefix,    '') }
css = Dir["#{style_prefix}**/*.css"].map  { |x| x.gsub(style_prefix, '') }
scss = Dir["#{style_prefix}**/*.scss"].map { |x| x.gsub(style_prefix, '') }
images = Dir["#{images_prefix}**/*.png"].map { |x| x.gsub(images_prefix, '') }
images += Dir["#{images_prefix}**/*.jpg"].map { |x| x.gsub(images_prefix, '') }
images += Dir["#{images_prefix}**/*.jpeg"].map { |x| x.gsub(images_prefix, '') }

Rails.application.config.assets.precompile += (javascripts + css + scss + images)

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in the app/assets
# folder are already added.
