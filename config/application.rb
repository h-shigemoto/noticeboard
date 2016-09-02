require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Noticeboard
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators { |g|
      # not create assets
      g.assets false
      # use testframework rspec.
      g.test_framework :rspec,
        view_specs: false,
        routing_specs: false,
        helper_specs: false,
        integration_specs: false
    }
  end
end
