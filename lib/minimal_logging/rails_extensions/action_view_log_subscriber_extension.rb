require 'action_view/log_subscriber'

ActionView::LogSubscriber.class_eval  do
  def render_template(event)
  end

  alias :render_partial :render_template
  alias :render_collection :render_template
end
