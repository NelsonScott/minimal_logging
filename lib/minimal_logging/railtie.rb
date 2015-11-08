require 'rails/railtie'

module MinimalLogging
  class Railtie < Rails::Railtie
    config.minimal_logging = ActiveSupport::OrderedOptions.new
    config.minimal_logging.enabled = true
    config.minimal_logging.change_log_level = true

    config.after_initialize do |app|
      MinimalLogging.setup(app) if app.config.minimal_logging.enabled
    end
  end
end
