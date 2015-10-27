require 'action_dispatch/http/parameter_filter'

module ActionDispatch
  module Http
    module FilterParameters
      def filtered_path
        @filtered_path ||= query_string.empty? ? path : "#{path}"
      end
    end
  end
end
