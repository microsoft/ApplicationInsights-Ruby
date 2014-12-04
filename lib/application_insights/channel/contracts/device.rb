require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type Device.
      class Device < JsonSerializable
        # Initializes a new instance of the Device class.
        def initialize(options={})
          defaults = {
            'ai.device.id' => nil,
            'ai.device.ip' => nil,
            'ai.device.language' => nil,
            'ai.device.locale' => nil,
            'ai.device.model' => nil,
            'ai.device.network' => nil,
            'ai.device.oemName' => nil,
            'ai.device.os' => nil,
            'ai.device.osVersion' => nil,
            'ai.device.roleInstance' => nil,
            'ai.device.roleName' => nil,
            'ai.device.screenResolution' => nil,
            'ai.device.type' => nil,
            'ai.device.vmName' => nil
          }
          values = {
          }
          super defaults, values, options
        end
        
        # Gets the id property.
        def id
          return @values['ai.device.id'] if @values.key?('ai.device.id')
          @defaults['ai.device.id']
        end
        
        # Sets the id property.
        def id=(value)
          if value == @defaults['ai.device.id']
            @values.delete 'ai.device.id' if @values.key? 'ai.device.id'
          else
            @values['ai.device.id'] = value
          end
        end
        
        # Gets the ip property.
        def ip
          return @values['ai.device.ip'] if @values.key?('ai.device.ip')
          @defaults['ai.device.ip']
        end
        
        # Sets the ip property.
        def ip=(value)
          if value == @defaults['ai.device.ip']
            @values.delete 'ai.device.ip' if @values.key? 'ai.device.ip'
          else
            @values['ai.device.ip'] = value
          end
        end
        
        # Gets the language property.
        def language
          return @values['ai.device.language'] if @values.key?('ai.device.language')
          @defaults['ai.device.language']
        end
        
        # Sets the language property.
        def language=(value)
          if value == @defaults['ai.device.language']
            @values.delete 'ai.device.language' if @values.key? 'ai.device.language'
          else
            @values['ai.device.language'] = value
          end
        end
        
        # Gets the locale property.
        def locale
          return @values['ai.device.locale'] if @values.key?('ai.device.locale')
          @defaults['ai.device.locale']
        end
        
        # Sets the locale property.
        def locale=(value)
          if value == @defaults['ai.device.locale']
            @values.delete 'ai.device.locale' if @values.key? 'ai.device.locale'
          else
            @values['ai.device.locale'] = value
          end
        end
        
        # Gets the model property.
        def model
          return @values['ai.device.model'] if @values.key?('ai.device.model')
          @defaults['ai.device.model']
        end
        
        # Sets the model property.
        def model=(value)
          if value == @defaults['ai.device.model']
            @values.delete 'ai.device.model' if @values.key? 'ai.device.model'
          else
            @values['ai.device.model'] = value
          end
        end
        
        # Gets the network property.
        def network
          return @values['ai.device.network'] if @values.key?('ai.device.network')
          @defaults['ai.device.network']
        end
        
        # Sets the network property.
        def network=(value)
          if value == @defaults['ai.device.network']
            @values.delete 'ai.device.network' if @values.key? 'ai.device.network'
          else
            @values['ai.device.network'] = value
          end
        end
        
        # Gets the oem_name property.
        def oem_name
          return @values['ai.device.oemName'] if @values.key?('ai.device.oemName')
          @defaults['ai.device.oemName']
        end
        
        # Sets the oem_name property.
        def oem_name=(value)
          if value == @defaults['ai.device.oemName']
            @values.delete 'ai.device.oemName' if @values.key? 'ai.device.oemName'
          else
            @values['ai.device.oemName'] = value
          end
        end
        
        # Gets the os property.
        def os
          return @values['ai.device.os'] if @values.key?('ai.device.os')
          @defaults['ai.device.os']
        end
        
        # Sets the os property.
        def os=(value)
          if value == @defaults['ai.device.os']
            @values.delete 'ai.device.os' if @values.key? 'ai.device.os'
          else
            @values['ai.device.os'] = value
          end
        end
        
        # Gets the os_version property.
        def os_version
          return @values['ai.device.osVersion'] if @values.key?('ai.device.osVersion')
          @defaults['ai.device.osVersion']
        end
        
        # Sets the os_version property.
        def os_version=(value)
          if value == @defaults['ai.device.osVersion']
            @values.delete 'ai.device.osVersion' if @values.key? 'ai.device.osVersion'
          else
            @values['ai.device.osVersion'] = value
          end
        end
        
        # Gets the role_instance property.
        def role_instance
          return @values['ai.device.roleInstance'] if @values.key?('ai.device.roleInstance')
          @defaults['ai.device.roleInstance']
        end
        
        # Sets the role_instance property.
        def role_instance=(value)
          if value == @defaults['ai.device.roleInstance']
            @values.delete 'ai.device.roleInstance' if @values.key? 'ai.device.roleInstance'
          else
            @values['ai.device.roleInstance'] = value
          end
        end
        
        # Gets the role_name property.
        def role_name
          return @values['ai.device.roleName'] if @values.key?('ai.device.roleName')
          @defaults['ai.device.roleName']
        end
        
        # Sets the role_name property.
        def role_name=(value)
          if value == @defaults['ai.device.roleName']
            @values.delete 'ai.device.roleName' if @values.key? 'ai.device.roleName'
          else
            @values['ai.device.roleName'] = value
          end
        end
        
        # Gets the screen_resolution property.
        def screen_resolution
          return @values['ai.device.screenResolution'] if @values.key?('ai.device.screenResolution')
          @defaults['ai.device.screenResolution']
        end
        
        # Sets the screen_resolution property.
        def screen_resolution=(value)
          if value == @defaults['ai.device.screenResolution']
            @values.delete 'ai.device.screenResolution' if @values.key? 'ai.device.screenResolution'
          else
            @values['ai.device.screenResolution'] = value
          end
        end
        
        # Gets the type property.
        def type
          return @values['ai.device.type'] if @values.key?('ai.device.type')
          @defaults['ai.device.type']
        end
        
        # Sets the type property.
        def type=(value)
          if value == @defaults['ai.device.type']
            @values.delete 'ai.device.type' if @values.key? 'ai.device.type'
          else
            @values['ai.device.type'] = value
          end
        end
        
        # Gets the vm_name property.
        def vm_name
          return @values['ai.device.vmName'] if @values.key?('ai.device.vmName')
          @defaults['ai.device.vmName']
        end
        
        # Sets the vm_name property.
        def vm_name=(value)
          if value == @defaults['ai.device.vmName']
            @values.delete 'ai.device.vmName' if @values.key? 'ai.device.vmName'
          else
            @values['ai.device.vmName'] = value
          end
        end
      end
    end
  end
end
