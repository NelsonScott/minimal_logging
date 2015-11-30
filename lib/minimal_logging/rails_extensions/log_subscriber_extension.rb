require 'action_controller/log_subscriber'
require 'colorize'
require 'awesome_print'

class ActionController::LogSubscriber
  def start_processing(event)
    return unless logger.info?

    payload = event.payload
    params  = payload[:params].except(*INTERNAL_PARAMS)
    format  = payload[:format]
    format  = format.to_s.upcase if format.is_a?(Symbol)
    action  = "#{payload[:action]}".upcase.red
    controller = " #{payload[:controller]}".red

    info(action + controller)
    info "Format #{format}".light_magenta
    info("Params".blue) && ap(params) unless params.empty?
  end

  def process_action(event)
    return unless logger.info?

    payload   = event.payload
    additions = ActionController::Base.log_process_action(payload)

    status = payload[:status]
    if status.nil? && payload[:exception].present?
      exception_class_name = payload[:exception].first
      status = ActionDispatch::ExceptionWrapper.status_code_for_exception(exception_class_name)
    end
    message = format_message(status)

    info(message)
  end

  def format_message(status)
    color = MinimalLogging.color_codes[status / 100]
    status.to_s.colorize(color)
  end
end
