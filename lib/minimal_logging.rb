require "minimal_logging/version"

module MinimalLogging
  def self.setup(app)
    Rails.logger.level = 1 if app.config.minimal_logging.change_log_level
    require "minimal_logging/rails_extensions/action_view_log_subscriber_extension.rb"
    require "minimal_logging/rails_extensions/filter_parameters_extension.rb"
    require "minimal_logging/rails_extensions/log_subscriber_extension.rb"
    require "minimal_logging/rails_extensions/logger_extension.rb"
  end

  require 'minimal_logging/railtie' if defined?(Rails)
end
