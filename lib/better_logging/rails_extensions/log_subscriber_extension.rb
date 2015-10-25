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

    #TODO try centering again, remember that colorize adds chars
    info "#{payload[:action]}".upcase.colorize(:red) + " #{payload[:controller]}".colorize(:red)

    unless params.empty?
      info "  Params: ".colorize(:blue)
      ap params
    end
  end
end
