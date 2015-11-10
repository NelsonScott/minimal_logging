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

    info "#{payload[:action]}".upcase.colorize(:red) + " #{payload[:controller]}".colorize(:red)

    unless params.empty?
      info "  Params: ".colorize(:blue)
      ap params
    end
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
    if status < 300
      color_status(status, :green)
    elsif status < 400
      color_status(status, :yellow)
    elsif status < 500
      color_status(status, :red)
    elsif status < 600
      color_status(status, :light_red)
    else
      status.to_s
    end
  end

  def color_status(status, color)
    status.to_s.colorize(color)
  end
end
