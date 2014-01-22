require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module PeerReview
  class Application < Rails::Application
    I18n.enforce_available_locales = true
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.i18n.default_locale = :en
    config.time_zone = "Berlin"
  end
end
