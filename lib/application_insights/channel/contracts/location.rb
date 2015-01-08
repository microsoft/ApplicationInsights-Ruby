require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type Location.
      class Location < JsonSerializable
        # Initializes a new instance of the Location class.
        def initialize(options={})
          defaults = {
            'ai.location.ip' => nil
          }
          values = {
          }
          super defaults, values, options
        end
        
        # Gets the ip property.
        def ip
          @values.fetch('ai.location.ip') { 
            @values['ai.location.ip'] = nil
          }
        end
        
        # Sets the ip property.
        def ip=(value)
          if value == @defaults['ai.location.ip']
            @values.delete 'ai.location.ip' if @values.key? 'ai.location.ip'
          else
            @values['ai.location.ip'] = value
          end
        end
      end
    end
  end
end
