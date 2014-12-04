require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type Operation.
      class Operation < JsonSerializable
        # Initializes a new instance of the Operation class.
        def initialize(options={})
          defaults = {
            'ai.operation.id' => nil,
            'ai.operation.name' => nil,
            'ai.operation.parentId' => nil,
            'ai.operation.rootId' => nil
          }
          values = {
          }
          super defaults, values, options
        end
        
        # Gets the id property.
        def id
          return @values['ai.operation.id'] if @values.key?('ai.operation.id')
          @defaults['ai.operation.id']
        end
        
        # Sets the id property.
        def id=(value)
          if value == @defaults['ai.operation.id']
            @values.delete 'ai.operation.id' if @values.key? 'ai.operation.id'
          else
            @values['ai.operation.id'] = value
          end
        end
        
        # Gets the name property.
        def name
          return @values['ai.operation.name'] if @values.key?('ai.operation.name')
          @defaults['ai.operation.name']
        end
        
        # Sets the name property.
        def name=(value)
          if value == @defaults['ai.operation.name']
            @values.delete 'ai.operation.name' if @values.key? 'ai.operation.name'
          else
            @values['ai.operation.name'] = value
          end
        end
        
        # Gets the parent_id property.
        def parent_id
          return @values['ai.operation.parentId'] if @values.key?('ai.operation.parentId')
          @defaults['ai.operation.parentId']
        end
        
        # Sets the parent_id property.
        def parent_id=(value)
          if value == @defaults['ai.operation.parentId']
            @values.delete 'ai.operation.parentId' if @values.key? 'ai.operation.parentId'
          else
            @values['ai.operation.parentId'] = value
          end
        end
        
        # Gets the root_id property.
        def root_id
          return @values['ai.operation.rootId'] if @values.key?('ai.operation.rootId')
          @defaults['ai.operation.rootId']
        end
        
        # Sets the root_id property.
        def root_id=(value)
          if value == @defaults['ai.operation.rootId']
            @values.delete 'ai.operation.rootId' if @values.key? 'ai.operation.rootId'
          else
            @values['ai.operation.rootId'] = value
          end
        end
      end
    end
  end
end
