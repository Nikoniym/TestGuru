require_relative 'boot'

require 'rails/all'
require 'dotenv/load'

Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    config.load_defaults 5.1
    config.time_zone = 'Moscow'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ru
  end
end
