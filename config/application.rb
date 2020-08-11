require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DwcRailsAppTemplate
  class Application < Rails::Application
  	Refile.secret_key = '1a3a6546db4911200f0a63c2cce77fd0ad96d3fd1ac044b9ed7b0c8b31a571906b61c62452221d8b7512e7adb23e7dfcfec904fadcb6e75e2a70e5eb955b5722'

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
