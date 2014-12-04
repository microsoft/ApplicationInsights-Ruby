require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type RequestData.
      class RequestData < JsonSerializable
        # Initializes a new instance of the RequestData class.
        def initialize(options={})
          defaults = {
            'ver' => 2,
            'id' => nil,
            'name' => nil,
            'startTime' => nil,
            'duration' => nil,
            'responseCode' => nil,
            'success' => nil,
            'httpMethod' => nil,
            'url' => nil,
            'properties' => {},
            'measurements' => {}
          }
          values = {
            'ver' => 2,
            'id' => nil,
            'startTime' => nil,
            'duration' => nil,
            'responseCode' => nil,
            'success' => nil
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
        
        # Gets the id property.
        def id
          @values['id']
        end
        
        # Sets the id property.
        def id=(value)
          @values['id'] = value
        end
        
        # Gets the name property.
        def name
          return @values['name'] if @values.key?('name')
          @defaults['name']
        end
        
        # Sets the name property.
        def name=(value)
          if value == @defaults['name']
            @values.delete 'name' if @values.key? 'name'
          else
            @values['name'] = value
          end
        end
        
        # Gets the start_time property.
        def start_time
          @values['startTime']
        end
        
        # Sets the start_time property.
        def start_time=(value)
          @values['startTime'] = value
        end
        
        # Gets the duration property.
        def duration
          @values['duration']
        end
        
        # Sets the duration property.
        def duration=(value)
          @values['duration'] = value
        end
        
        # Gets the response_code property.
        def response_code
          @values['responseCode']
        end
        
        # Sets the response_code property.
        def response_code=(value)
          @values['responseCode'] = value
        end
        
        # Gets the success property.
        def success
          @values['success']
        end
        
        # Sets the success property.
        def success=(value)
          @values['success'] = value
        end
        
        # Gets the http_method property.
        def http_method
          return @values['httpMethod'] if @values.key?('httpMethod')
          @defaults['httpMethod']
        end
        
        # Sets the http_method property.
        def http_method=(value)
          if value == @defaults['httpMethod']
            @values.delete 'httpMethod' if @values.key? 'httpMethod'
          else
            @values['httpMethod'] = value
          end
        end
        
        # Gets the url property.
        def url
          return @values['url'] if @values.key?('url')
          @defaults['url']
        end
        
        # Sets the url property.
        def url=(value)
          if value == @defaults['url']
            @values.delete 'url' if @values.key? 'url'
          else
            @values['url'] = value
          end
        end
        
        # Gets the properties property.
        def properties
          return @values['properties'] if @values.key?('properties')
          @values['properties'] = {}
          @values['properties']
        end
        
        # Sets the properties property.
        def properties=(value)
          if value == @defaults['properties']
            @values.delete 'properties' if @values.key? 'properties'
          else
            @values['properties'] = value
          end
        end
        
        # Gets the measurements property.
        def measurements
          return @values['measurements'] if @values.key?('measurements')
          @values['measurements'] = {}
          @values['measurements']
        end
        
        # Sets the measurements property.
        def measurements=(value)
          if value == @defaults['measurements']
            @values.delete 'measurements' if @values.key? 'measurements'
          else
            @values['measurements'] = value
          end
        end
      end
    end
  end
end
