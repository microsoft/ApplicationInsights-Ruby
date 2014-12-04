require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type Application.
      class Application < JsonSerializable
        # Initializes a new instance of the Application class.
        def initialize(options={})
          defaults = {
            'ai.application.ver' => nil
          }
          values = {
          }
          super defaults, values, options
        end
        
        # Gets the ver property.
        def ver
          return @values['ai.application.ver'] if @values.key?('ai.application.ver')
          @defaults['ai.application.ver']
        end
        
        # Sets the ver property.
        def ver=(value)
          if value == @defaults['ai.application.ver']
            @values.delete 'ai.application.ver' if @values.key? 'ai.application.ver'
          else
            @values['ai.application.ver'] = value
          end
        end
      end
    end
  end
end
