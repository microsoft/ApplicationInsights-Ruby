require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type StackFrame.
      class StackFrame < JsonSerializable
        # Initializes a new instance of the StackFrame class.
        def initialize(options={})
          defaults = {
            'level' => nil,
            'method' => nil,
            'assembly' => nil,
            'fileName' => nil,
            'line' => nil
          }
          values = {
            'level' => nil,
            'method' => nil
          }
          super defaults, values, options
        end
        
        # Gets the level property.
        def level
          @values['level']
        end
        
        # Sets the level property.
        def level=(value)
          @values['level'] = value
        end
        
        # Gets the method property.
        def method
          @values['method']
        end
        
        # Sets the method property.
        def method=(value)
          @values['method'] = value
        end
        
        # Gets the assembly property.
        def assembly
          @values.fetch('assembly') { 
            @values['assembly'] = nil
          }
        end
        
        # Sets the assembly property.
        def assembly=(value)
          if value == @defaults['assembly']
            @values.delete 'assembly' if @values.key? 'assembly'
          else
            @values['assembly'] = value
          end
        end
        
        # Gets the file_name property.
        def file_name
          @values.fetch('fileName') { 
            @values['fileName'] = nil
          }
        end
        
        # Sets the file_name property.
        def file_name=(value)
          if value == @defaults['fileName']
            @values.delete 'fileName' if @values.key? 'fileName'
          else
            @values['fileName'] = value
          end
        end
        
        # Gets the line property.
        def line
          @values.fetch('line') { 
            @values['line'] = nil
          }
        end
        
        # Sets the line property.
        def line=(value)
          if value == @defaults['line']
            @values.delete 'line' if @values.key? 'line'
          else
            @values['line'] = value
          end
        end
      end
    end
  end
end
