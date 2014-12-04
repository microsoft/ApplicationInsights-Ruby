require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type User.
      class User < JsonSerializable
        # Initializes a new instance of the User class.
        def initialize(options={})
          defaults = {
            'ai.user.accountAcquisitionDate' => nil,
            'ai.user.accountId' => nil,
            'ai.user.userAgent' => nil,
            'ai.user.id' => nil
          }
          values = {
          }
          super defaults, values, options
        end
        
        # Gets the account_acquisition_date property.
        def account_acquisition_date
          return @values['ai.user.accountAcquisitionDate'] if @values.key?('ai.user.accountAcquisitionDate')
          @defaults['ai.user.accountAcquisitionDate']
        end
        
        # Sets the account_acquisition_date property.
        def account_acquisition_date=(value)
          if value == @defaults['ai.user.accountAcquisitionDate']
            @values.delete 'ai.user.accountAcquisitionDate' if @values.key? 'ai.user.accountAcquisitionDate'
          else
            @values['ai.user.accountAcquisitionDate'] = value
          end
        end
        
        # Gets the account_id property.
        def account_id
          return @values['ai.user.accountId'] if @values.key?('ai.user.accountId')
          @defaults['ai.user.accountId']
        end
        
        # Sets the account_id property.
        def account_id=(value)
          if value == @defaults['ai.user.accountId']
            @values.delete 'ai.user.accountId' if @values.key? 'ai.user.accountId'
          else
            @values['ai.user.accountId'] = value
          end
        end
        
        # Gets the user_agent property.
        def user_agent
          return @values['ai.user.userAgent'] if @values.key?('ai.user.userAgent')
          @defaults['ai.user.userAgent']
        end
        
        # Sets the user_agent property.
        def user_agent=(value)
          if value == @defaults['ai.user.userAgent']
            @values.delete 'ai.user.userAgent' if @values.key? 'ai.user.userAgent'
          else
            @values['ai.user.userAgent'] = value
          end
        end
        
        # Gets the id property.
        def id
          return @values['ai.user.id'] if @values.key?('ai.user.id')
          @defaults['ai.user.id']
        end
        
        # Sets the id property.
        def id=(value)
          if value == @defaults['ai.user.id']
            @values.delete 'ai.user.id' if @values.key? 'ai.user.id'
          else
            @values['ai.user.id'] = value
          end
        end
      end
    end
  end
end
