require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type Data.
      class Data < JsonSerializable
        # Initializes a new instance of the Data class.
        def initialize(options={})
          defaults = {
            'baseType' => nil,
            'baseData' => nil
          }
          values = {
            'baseData' => nil
          }
          super defaults, values, options
        end
        
        # Gets the base_type property.
        def base_type
          return @values['baseType'] if @values.key?('baseType')
          @defaults['baseType']
        end
        
        # Sets the base_type property.
        def base_type=(value)
          if value == @defaults['baseType']
            @values.delete 'baseType' if @values.key? 'baseType'
          else
            @values['baseType'] = value
          end
        end
        
        # Gets the base_data property.
        def base_data
          @values['baseData']
        end
        
        # Sets the base_data property.
        def base_data=(value)
          @values['baseData'] = value
        end
      end
    end
  end
end
