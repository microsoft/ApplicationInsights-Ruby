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
              'ai.user.id' => nil,
              'ai.user.authUserId' => nil,
              'ai.user.storeRegion' => nil
          }
          values = {
          }
          super defaults, values, options
        end

        # Gets the account_acquisition_date property.
        def account_acquisition_date
          @values.fetch('ai.user.accountAcquisitionDate') {
            @values['ai.user.accountAcquisitionDate'] = nil
          }
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
          @values.fetch('ai.user.accountId') {
            @values['ai.user.accountId'] = nil
          }
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
          @values.fetch('ai.user.userAgent') {
            @values['ai.user.userAgent'] = nil
          }
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
          @values.fetch('ai.user.id') {
            @values['ai.user.id'] = nil
          }
        end

        # Sets the id property.
        def id=(value)
          if value == @defaults['ai.user.id']
            @values.delete 'ai.user.id' if @values.key? 'ai.user.id'
          else
            @values['ai.user.id'] = value
          end
        end

        # Gets the account_id property.
        def auth_id
          @values.fetch('ai.user.authUserId') {
            @values['ai.user.authUserId'] = nil
          }
        end

        # Sets the account_id property.
        def auth_id=(value)
          if value == @defaults['ai.user.authUserId']
            @values.delete 'ai.user.authUserId' if @values.key? 'ai.user.authUserId'
          else
            @values['ai.user.authUserId'] = value
          end
        end

        # Gets the store_region property.
        def store_region
          @values.fetch('ai.user.storeRegion') {
            @values['ai.user.storeRegion'] = nil
          }
        end

        # Sets the store_region property.
        def store_region=(value)
          if value == @defaults['ai.user.storeRegion']
            @values.delete 'ai.user.storeRegion' if @values.key? 'ai.user.storeRegion'
          else
            @values['ai.user.storeRegion'] = value
          end
        end
      end
    end
  end
end
