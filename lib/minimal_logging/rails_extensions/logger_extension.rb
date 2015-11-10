require 'logger'

ASSETS_REGEX = MinimalLogging.assets_regex
Rails::Rack::Logger.class_eval do

  def call_with_quiet_assets(env)
    old_level = nil

    begin
      if env['PATH_INFO'] =~ ASSETS_REGEX
        old_level = Rails.logger.level
        Rails.logger.level = Logger::ERROR
      end
      call_without_quiet_assets(env)
    ensure
      Rails.logger.level = old_level if old_level
    end
  end

  if MinimalLogging.quiet_assets?
    MinimalLogging.app.config.assets.logger = false
    alias_method_chain :call, :quiet_assets
  end

  protected

  def call_app(request, env)
    instrumenter = ActiveSupport::Notifications.instrumenter
    instrumenter.start 'request.action_dispatch', request: request
    logger.info ''
    logger.info started_request_message(request)
    resp = @app.call(env)
    resp[2] = ::Rack::BodyProxy.new(resp[2]) { finish(request) }
    resp
  rescue
    finish(request)
    raise
  ensure
    ActiveSupport::LogSubscriber.flush_all!
  end

  def started_request_message(request)
    method = request.request_method.colorize(:blue)
    path = request.filtered_path.colorize(:magenta)
    output = method + " " + path
  end
end
