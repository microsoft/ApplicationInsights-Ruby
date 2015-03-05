require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type ExceptionData.
      class ExceptionData < JsonSerializable
        # Initializes a new instance of the ExceptionData class.
        def initialize(options={})
          defaults = {
            'ver' => 2,
            'handledAt' => nil,
            'exceptions' => [],
            'severityLevel' => nil,
            'problemId' => nil,
            'crashThreadId' => nil,
            'properties' => {},
            'measurements' => {}
          }
          values = {
            'ver' => 2,
            'handledAt' => nil,
            'exceptions' => []
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
        
        # Gets the handled_at property.
        def handled_at
          @values['handledAt']
        end
        
        # Sets the handled_at property.
        def handled_at=(value)
          @values['handledAt'] = value
        end
        
        # Gets the exceptions property.
        def exceptions
          @values['exceptions']
        end
        
        # Sets the exceptions property.
        def exceptions=(value)
          @values['exceptions'] = value
        end
        
        # Gets the severity_level property.
        def severity_level
          @values.fetch('severityLevel') { 
            @values['severityLevel'] = nil
          }
        end
        
        # Sets the severity_level property.
        def severity_level=(value)
          if value == @defaults['severityLevel']
            @values.delete 'severityLevel' if @values.key? 'severityLevel'
          else
            @values['severityLevel'] = value
          end
        end
        
        # Gets the problem_id property.
        def problem_id
          @values.fetch('problemId') { 
            @values['problemId'] = nil
          }
        end
        
        # Sets the problem_id property.
        def problem_id=(value)
          if value == @defaults['problemId']
            @values.delete 'problemId' if @values.key? 'problemId'
          else
            @values['problemId'] = value
          end
        end
        
        # Gets the crash_thread_id property.
        def crash_thread_id
          @values.fetch('crashThreadId') { 
            @values['crashThreadId'] = nil
          }
        end
        
        # Sets the crash_thread_id property.
        def crash_thread_id=(value)
          if value == @defaults['crashThreadId']
            @values.delete 'crashThreadId' if @values.key? 'crashThreadId'
          else
            @values['crashThreadId'] = value
          end
        end
        
        # Gets the properties property.
        def properties
          @values.fetch('properties') { 
            @values['properties'] = {}
          }
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
          @values.fetch('measurements') { 
            @values['measurements'] = {}
          }
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
