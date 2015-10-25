require 'logger'

Rails::Rack::Logger.class_eval do

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

  # GET "/session/new"
  def started_request_message(request)
    method = request.request_method.colorize(:blue)
    path = request.filtered_path.colorize(:magenta)
    output = method + " " + path
  end
end
