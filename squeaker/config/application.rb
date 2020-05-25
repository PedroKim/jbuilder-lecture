require_relative 'boot'

# This is the standard line, requiring in all the pieces of rails
# needed to set up our configuration 
require 'rails/all'


# These lines instead of `require "rails/all"` removes the activestorage routes
# require "rails"
# # Include each railties manually, excluding `active_storage/engine`
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
# # require "active_storage/engine"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"





# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Squeaker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.generators do |g|
      g.test_framework :rspec, # Tells rails to use rspec for testing
        :fixtures => false, # Fixtures are rails default way of creating objects for testing, we will do this ourselves.
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => false,
        :request_specs => false
        # all of the other falses here are telling rails not to auto generate tests for those types of files.  We will do these manually.
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
