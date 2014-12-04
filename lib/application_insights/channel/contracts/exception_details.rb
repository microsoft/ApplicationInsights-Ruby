require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type ExceptionDetails.
      class ExceptionDetails < JsonSerializable
        # Initializes a new instance of the ExceptionDetails class.
        def initialize(options={})
          defaults = {
            'id' => nil,
            'outerId' => nil,
            'typeName' => nil,
            'message' => nil,
            'hasFullStack' => true,
            'stack' => nil,
            'parsedStack' => []
          }
          values = {
            'typeName' => nil,
            'message' => nil,
            'hasFullStack' => true
          }
          super defaults, values, options
        end
        
        # Gets the id property.
        def id
          return @values['id'] if @values.key?('id')
          @defaults['id']
        end
        
        # Sets the id property.
        def id=(value)
          if value == @defaults['id']
            @values.delete 'id' if @values.key? 'id'
          else
            @values['id'] = value
          end
        end
        
        # Gets the outer_id property.
        def outer_id
          return @values['outerId'] if @values.key?('outerId')
          @defaults['outerId']
        end
        
        # Sets the outer_id property.
        def outer_id=(value)
          if value == @defaults['outerId']
            @values.delete 'outerId' if @values.key? 'outerId'
          else
            @values['outerId'] = value
          end
        end
        
        # Gets the type_name property.
        def type_name
          @values['typeName']
        end
        
        # Sets the type_name property.
        def type_name=(value)
          @values['typeName'] = value
        end
        
        # Gets the message property.
        def message
          @values['message']
        end
        
        # Sets the message property.
        def message=(value)
          @values['message'] = value
        end
        
        # Gets the has_full_stack property.
        def has_full_stack
          return @values['hasFullStack'] if @values.key?('hasFullStack')
          @defaults['hasFullStack']
        end
        
        # Sets the has_full_stack property.
        def has_full_stack=(value)
          if value == @defaults['hasFullStack']
            @values.delete 'hasFullStack' if @values.key? 'hasFullStack'
          else
            @values['hasFullStack'] = value
          end
        end
        
        # Gets the stack property.
        def stack
          return @values['stack'] if @values.key?('stack')
          @defaults['stack']
        end
        
        # Sets the stack property.
        def stack=(value)
          if value == @defaults['stack']
            @values.delete 'stack' if @values.key? 'stack'
          else
            @values['stack'] = value
          end
        end
        
        # Gets the parsed_stack property.
        def parsed_stack
          return @values['parsedStack'] if @values.key?('parsedStack')
          @values['parsedStack'] = []
          @values['parsedStack']
        end
        
        # Sets the parsed_stack property.
        def parsed_stack=(value)
          if value == @defaults['parsedStack']
            @values.delete 'parsedStack' if @values.key? 'parsedStack'
          else
            @values['parsedStack'] = value
          end
        end
      end
    end
  end
end
