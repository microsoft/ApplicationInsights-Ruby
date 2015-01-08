require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type Session.
      class Session < JsonSerializable
        # Initializes a new instance of the Session class.
        def initialize(options={})
          defaults = {
            'ai.session.id' => nil,
            'ai.session.isFirst' => nil,
            'ai.session.isNew' => nil
          }
          values = {
          }
          super defaults, values, options
        end
        
        # Gets the id property.
        def id
          @values.fetch('ai.session.id') { 
            @values['ai.session.id'] = nil
          }
        end
        
        # Sets the id property.
        def id=(value)
          if value == @defaults['ai.session.id']
            @values.delete 'ai.session.id' if @values.key? 'ai.session.id'
          else
            @values['ai.session.id'] = value
          end
        end
        
        # Gets the is_first property.
        def is_first
          @values.fetch('ai.session.isFirst') { 
            @values['ai.session.isFirst'] = nil
          }
        end
        
        # Sets the is_first property.
        def is_first=(value)
          if value == @defaults['ai.session.isFirst']
            @values.delete 'ai.session.isFirst' if @values.key? 'ai.session.isFirst'
          else
            @values['ai.session.isFirst'] = value
          end
        end
        
        # Gets the is_new property.
        def is_new
          @values.fetch('ai.session.isNew') { 
            @values['ai.session.isNew'] = nil
          }
        end
        
        # Sets the is_new property.
        def is_new=(value)
          if value == @defaults['ai.session.isNew']
            @values.delete 'ai.session.isNew' if @values.key? 'ai.session.isNew'
          else
            @values['ai.session.isNew'] = value
          end
        end
      end
    end
  end
end
