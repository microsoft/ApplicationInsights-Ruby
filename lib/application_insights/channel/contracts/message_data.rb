require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type MessageData.
      class MessageData < JsonSerializable
        # Initializes a new instance of the MessageData class.
        def initialize(options={})
          defaults = {
            'ver' => 2,
            'message' => nil,
            'severityLevel' => nil,
            'properties' => {}
          }
          values = {
            'ver' => 2,
            'message' => nil
          }
          super defaults, values, options
        end
        
        # Gets the ver property.
        def ver
          @values['ver']
        end
        
        # Sets the ver property.
        def ver=(value)
          @values['ver'] = value
        end
        
        # Gets the message property.
        def message
          @values['message']
        end
        
        # Sets the message property.
        def message=(value)
          @values['message'] = value
        end
        
        # Gets the severity_level property.
        def severity_level
          return @values['severityLevel'] if @values.key?('severityLevel')
          @defaults['severityLevel']
        end
        
        # Sets the severity_level property.
        def severity_level=(value)
          if value == @defaults['severityLevel']
            @values.delete 'severityLevel' if @values.key? 'severityLevel'
          else
            @values['severityLevel'] = value
          end
        end
        
        # Gets the properties property.
        def properties
          return @values['properties'] if @values.key?('properties')
          @values['properties'] = {}
          @values['properties']
        end
        
        # Sets the properties property.
        def properties=(value)
          if value == @defaults['properties']
            @values.delete 'properties' if @values.key? 'properties'
          else
            @values['properties'] = value
          end
        end
      end
    end
  end
end
