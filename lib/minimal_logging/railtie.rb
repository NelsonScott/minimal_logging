require 'rails/railtie'

module MinimalLogging
  class Railtie < Rails::Railtie
    config.minimal_logging = ActiveSupport::OrderedOptions.new
    config.minimal_logging.enabled = false

    config.after_initialize do |app|
      MinimalLogging.setup(app) if app.config.minimal_logging.enabled
    end
  end
end
