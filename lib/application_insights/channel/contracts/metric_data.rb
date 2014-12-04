require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type MetricData.
      class MetricData < JsonSerializable
        # Initializes a new instance of the MetricData class.
        def initialize(options={})
          defaults = {
            'ver' => 2,
            'metrics' => [],
            'properties' => {}
          }
          values = {
            'ver' => 2,
            'metrics' => []
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
        
        # Gets the metrics property.
        def metrics
          @values['metrics']
        end
        
        # Sets the metrics property.
        def metrics=(value)
          @values['metrics'] = value
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
