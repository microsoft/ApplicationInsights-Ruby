require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type DependencyKind.
      class DependencyKind
        # Enumeration value UNDEFINED.
        UNDEFINED = 0
        
        # Enumeration value HTTP_ONLY.
        HTTP_ONLY = 1
        
        # Enumeration value HTTP_ANY.
        HTTP_ANY = 2
        
        # Enumeration value SQL.
        SQL = 3
      end
    end
  end
end
