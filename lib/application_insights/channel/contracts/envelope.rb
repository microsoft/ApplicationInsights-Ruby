require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type Envelope.
      class Envelope < JsonSerializable
        # Initializes a new instance of the Envelope class.
        def initialize(options={})
          defaults = {
            'ver' => 1,
            'name' => nil,
            'time' => nil,
            'sampleRate' => 100.0,
            'seq' => nil,
            'iKey' => nil,
            'flags' => nil,
            'deviceId' => nil,
            'os' => nil,
            'osVer' => nil,
            'appId' => nil,
            'appVer' => nil,
            'userId' => nil,
            'tags' => {},
            'data' => nil
          }
          values = {
            'ver' => 1,
            'name' => nil,
            'time' => nil,
            'sampleRate' => 100.0
          }
          super defaults, values, options
        end
        
        # Gets the ver property.
        def ver
          return @values['ver'] if @values.key?('ver')
          @defaults['ver']
        end
        
        # Sets the ver property.
        def ver=(value)
          if value == @defaults['ver']
            @values.delete 'ver' if @values.key? 'ver'
          else
            @values['ver'] = value
          end
        end
        
        # Gets the name property.
        def name
          @values['name']
        end
        
        # Sets the name property.
        def name=(value)
          @values['name'] = value
        end
        
        # Gets the time property.
        def time
          @values['time']
        end
        
        # Sets the time property.
        def time=(value)
          @values['time'] = value
        end
        
        # Gets the sample_rate property.
        def sample_rate
          return @values['sampleRate'] if @values.key?('sampleRate')
          @defaults['sampleRate']
        end
        
        # Sets the sample_rate property.
        def sample_rate=(value)
          if value == @defaults['sampleRate']
            @values.delete 'sampleRate' if @values.key? 'sampleRate'
          else
            @values['sampleRate'] = value
          end
        end
        
        # Gets the seq property.
        def seq
          return @values['seq'] if @values.key?('seq')
          @defaults['seq']
        end
        
        # Sets the seq property.
        def seq=(value)
          if value == @defaults['seq']
            @values.delete 'seq' if @values.key? 'seq'
          else
            @values['seq'] = value
          end
        end
        
        # Gets the i_key property.
        def i_key
          return @values['iKey'] if @values.key?('iKey')
          @defaults['iKey']
        end
        
        # Sets the i_key property.
        def i_key=(value)
          if value == @defaults['iKey']
            @values.delete 'iKey' if @values.key? 'iKey'
          else
            @values['iKey'] = value
          end
        end
        
        # Gets the flags property.
        def flags
          return @values['flags'] if @values.key?('flags')
          @defaults['flags']
        end
        
        # Sets the flags property.
        def flags=(value)
          if value == @defaults['flags']
            @values.delete 'flags' if @values.key? 'flags'
          else
            @values['flags'] = value
          end
        end
        
        # Gets the device_id property.
        def device_id
          return @values['deviceId'] if @values.key?('deviceId')
          @defaults['deviceId']
        end
        
        # Sets the device_id property.
        def device_id=(value)
          if value == @defaults['deviceId']
            @values.delete 'deviceId' if @values.key? 'deviceId'
          else
            @values['deviceId'] = value
          end
        end
        
        # Gets the os property.
        def os
          return @values['os'] if @values.key?('os')
          @defaults['os']
        end
        
        # Sets the os property.
        def os=(value)
          if value == @defaults['os']
            @values.delete 'os' if @values.key? 'os'
          else
            @values['os'] = value
          end
        end
        
        # Gets the os_ver property.
        def os_ver
          return @values['osVer'] if @values.key?('osVer')
          @defaults['osVer']
        end
        
        # Sets the os_ver property.
        def os_ver=(value)
          if value == @defaults['osVer']
            @values.delete 'osVer' if @values.key? 'osVer'
          else
            @values['osVer'] = value
          end
        end
        
        # Gets the app_id property.
        def app_id
          return @values['appId'] if @values.key?('appId')
          @defaults['appId']
        end
        
        # Sets the app_id property.
        def app_id=(value)
          if value == @defaults['appId']
            @values.delete 'appId' if @values.key? 'appId'
          else
            @values['appId'] = value
          end
        end
        
        # Gets the app_ver property.
        def app_ver
          return @values['appVer'] if @values.key?('appVer')
          @defaults['appVer']
        end
        
        # Sets the app_ver property.
        def app_ver=(value)
          if value == @defaults['appVer']
            @values.delete 'appVer' if @values.key? 'appVer'
          else
            @values['appVer'] = value
          end
        end
        
        # Gets the user_id property.
        def user_id
          return @values['userId'] if @values.key?('userId')
          @defaults['userId']
        end
        
        # Sets the user_id property.
        def user_id=(value)
          if value == @defaults['userId']
            @values.delete 'userId' if @values.key? 'userId'
          else
            @values['userId'] = value
          end
        end
        
        # Gets the tags property.
        def tags
          return @values['tags'] if @values.key?('tags')
          @values['tags'] = {}
          @values['tags']
        end
        
        # Sets the tags property.
        def tags=(value)
          if value == @defaults['tags']
            @values.delete 'tags' if @values.key? 'tags'
          else
            @values['tags'] = value
          end
        end
        
        # Gets the data property.
        def data
          return @values['data'] if @values.key?('data')
          @defaults['data']
        end
        
        # Sets the data property.
        def data=(value)
          if value == @defaults['data']
            @values.delete 'data' if @values.key? 'data'
          else
            @values['data'] = value
          end
        end
      end
    end
  end
end
