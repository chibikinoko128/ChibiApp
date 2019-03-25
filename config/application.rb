require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chibi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.paths.add 'lib', eager_load: true
    
    config.i18n.load_path +=
      Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.helper false
      g.assets false
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
    end
    
      #config.action_controller.permit_all_parameters = true 
      config.action_controller.permit_all_parameters = false
    config.paths.add 'lib', eager_load: true
    config.autoload_paths += %W(#{config.root}/lib)
    config.enable_dependency_loading = true
    config.autoload_paths << Rails.root.join('lib')
  end
end
