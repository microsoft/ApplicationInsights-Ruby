require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      require_relative 'data_point_type'
      # Data contract class for type DataPoint.
      class DataPoint < JsonSerializable
        # Initializes a new instance of the DataPoint class.
        def initialize(options={})
          defaults = {
            'name' => nil,
            'kind' => DataPointType::MEASUREMENT,
            'value' => nil,
            'count' => nil,
            'min' => nil,
            'max' => nil,
            'stdDev' => nil
          }
          values = {
            'name' => nil,
            'kind' => DataPointType::MEASUREMENT,
            'value' => nil
          }
          super defaults, values, options
        end
        
        # Gets the name property.
        def name
          @values['name']
        end
        
        # Sets the name property.
        def name=(value)
          @values['name'] = value
        end
        
        # Gets the kind property.
        def kind
          @values.fetch('kind') { 
            @values['kind'] = DataPointType::MEASUREMENT
          }
        end
        
        # Sets the kind property.
        def kind=(value)
          if value == @defaults['kind']
            @values.delete 'kind' if @values.key? 'kind'
          else
            @values['kind'] = value
          end
        end
        
        # Gets the value property.
        def value
          @values['value']
        end
        
        # Sets the value property.
        def value=(value)
          @values['value'] = value
        end
        
        # Gets the count property.
        def count
          @values.fetch('count') { 
            @values['count'] = nil
          }
        end
        
        # Sets the count property.
        def count=(value)
          if value == @defaults['count']
            @values.delete 'count' if @values.key? 'count'
          else
            @values['count'] = value
          end
        end
        
        # Gets the min property.
        def min
          @values.fetch('min') { 
            @values['min'] = nil
          }
        end
        
        # Sets the min property.
        def min=(value)
          if value == @defaults['min']
            @values.delete 'min' if @values.key? 'min'
          else
            @values['min'] = value
          end
        end
        
        # Gets the max property.
        def max
          @values.fetch('max') { 
            @values['max'] = nil
          }
        end
        
        # Sets the max property.
        def max=(value)
          if value == @defaults['max']
            @values.delete 'max' if @values.key? 'max'
          else
            @values['max'] = value
          end
        end
        
        # Gets the std_dev property.
        def std_dev
          @values.fetch('stdDev') { 
            @values['stdDev'] = nil
          }
        end
        
        # Sets the std_dev property.
        def std_dev=(value)
          if value == @defaults['stdDev']
            @values.delete 'stdDev' if @values.key? 'stdDev'
          else
            @values['stdDev'] = value
          end
        end
      end
    end
  end
end
