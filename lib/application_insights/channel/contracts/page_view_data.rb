require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type PageViewData.
      class PageViewData < JsonSerializable
        # Initializes a new instance of the PageViewData class.
        def initialize(options={})
          defaults = {
            'ver' => 2,
            'url' => nil,
            'name' => nil,
            'duration' => nil,
            'properties' => {},
            'measurements' => {}
          }
          values = {
            'ver' => 2,
            'name' => nil
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
        
        # Gets the name property.
        def name
          @values['name']
        end
        
        # Sets the name property.
        def name=(value)
          @values['name'] = value
        end
        
        # Gets the duration property.
        def duration
          return @values['duration'] if @values.key?('duration')
          @defaults['duration']
        end
        
        # Sets the duration property.
        def duration=(value)
          if value == @defaults['duration']
            @values.delete 'duration' if @values.key? 'duration'
          else
            @values['duration'] = value
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
