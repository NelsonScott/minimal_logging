require "minimal_logging/version"

module MinimalLogging
  def self.setup(app)
    require "minimal_logging/rails_extensions/action_view_log_subscriber_extension.rb"
    require "minimal_logging/rails_extensions/filter_parameters_extension.rb"
    require "minimal_logging/rails_extensions/log_subscriber_extension.rb"
    require "minimal_logging/rails_extensions/logger_extension.rb"
  end

  require 'minimal_logging/railtie' if defined?(Rails)
end
