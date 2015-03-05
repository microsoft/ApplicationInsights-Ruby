require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type Application.
      class Application < JsonSerializable
        # Initializes a new instance of the Application class.
        def initialize(options={})
          defaults = {
            'ai.application.ver' => nil,
            'ai.application.build' => nil
          }
          values = {
          }
          super defaults, values, options
        end
        
        # Gets the ver property.
        def ver
          @values.fetch('ai.application.ver') { 
            @values['ai.application.ver'] = nil
          }
        end
        
        # Sets the ver property.
        def ver=(value)
          if value == @defaults['ai.application.ver']
            @values.delete 'ai.application.ver' if @values.key? 'ai.application.ver'
          else
            @values['ai.application.ver'] = value
          end
        end
        
        # Gets the build property.
        def build
          @values.fetch('ai.application.build') { 
            @values['ai.application.build'] = nil
          }
        end
        
        # Sets the build property.
        def build=(value)
          if value == @defaults['ai.application.build']
            @values.delete 'ai.application.build' if @values.key? 'ai.application.build'
          else
            @values['ai.application.build'] = value
          end
        end
      end
    end
  end
end
