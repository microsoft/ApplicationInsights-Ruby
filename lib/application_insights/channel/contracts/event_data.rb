require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type EventData.
      class EventData < JsonSerializable
        # Initializes a new instance of the EventData class.
        def initialize(options={})
          defaults = {
            'ver' => 2,
            'name' => nil,
            'properties' => {},
            'measurements' => {}
          }
          values = {
            'ver' => 2,
            'name' => nil
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
        
        # Gets the name property.
        def name
          @values['name']
        end
        
        # Sets the name property.
        def name=(value)
          @values['name'] = value
        end
        
        # Gets the properties property.
        def properties
          @values.fetch('properties') { 
            @values['properties'] = {}
          }
        end
        
        # Sets the properties property.
        def properties=(value)
          if value == @defaults['properties']
            @values.delete 'properties' if @values.key? 'properties'
          else
            @values['properties'] = value
          end
        end
        
        # Gets the measurements property.
        def measurements
          @values.fetch('measurements') { 
            @values['measurements'] = {}
          }
        end
        
        # Sets the measurements property.
        def measurements=(value)
          if value == @defaults['measurements']
            @values.delete 'measurements' if @values.key? 'measurements'
          else
            @values['measurements'] = value
          end
        end
      end
    end
  end
end
