require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type DataPointType.
      class DataPointType
        # Enumeration value MEASUREMENT.
        MEASUREMENT = 0
        
        # Enumeration value AGGREGATION.
        AGGREGATION = 1
      end
    end
  end
end
