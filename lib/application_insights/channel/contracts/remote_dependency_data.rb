require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      require_relative 'data_point_type'
      require_relative 'dependency_kind'
      require_relative 'dependency_source_type'
      # Data contract class for type RemoteDependencyData.
      class RemoteDependencyData < JsonSerializable
        # Initializes a new instance of the RemoteDependencyData class.
        def initialize(options={})
          defaults = {
            'ver' => 2,
            'name' => nil,
            'kind' => DataPointType::MEASUREMENT,
            'value' => nil,
            'count' => nil,
            'min' => nil,
            'max' => nil,
            'stdDev' => nil,
            'dependencyKind' => DependencyKind::UNDEFINED,
            'success' => true,
            'async' => nil,
            'dependencySource' => DependencySourceType::UNDEFINED,
            'properties' => {}
          }
          values = {
            'ver' => 2,
            'name' => nil,
            'kind' => DataPointType::MEASUREMENT,
            'value' => nil,
            'dependencyKind' => DependencyKind::UNDEFINED,
            'success' => true,
            'dependencySource' => DependencySourceType::UNDEFINED
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
        
        # Gets the dependency_kind property.
        def dependency_kind
          @values['dependencyKind']
        end
        
        # Sets the dependency_kind property.
        def dependency_kind=(value)
          @values['dependencyKind'] = value
        end
        
        # Gets the success property.
        def success
          @values.fetch('success') { 
            @values['success'] = true
          }
        end
        
        # Sets the success property.
        def success=(value)
          if value == @defaults['success']
            @values.delete 'success' if @values.key? 'success'
          else
            @values['success'] = value
          end
        end
        
        # Gets the async property.
        def async
          @values.fetch('async') { 
            @values['async'] = nil
          }
        end
        
        # Sets the async property.
        def async=(value)
          if value == @defaults['async']
            @values.delete 'async' if @values.key? 'async'
          else
            @values['async'] = value
          end
        end
        
        # Gets the dependency_source property.
        def dependency_source
          @values.fetch('dependencySource') { 
            @values['dependencySource'] = DependencySourceType::UNDEFINED
          }
        end
        
        # Sets the dependency_source property.
        def dependency_source=(value)
          if value == @defaults['dependencySource']
            @values.delete 'dependencySource' if @values.key? 'dependencySource'
          else
            @values['dependencySource'] = value
          end
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
      end
    end
  end
end
