require_relative 'contracts/application'
require_relative 'contracts/device'
require_relative 'contracts/user'
require_relative 'contracts/session'
require_relative 'contracts/operation'
require_relative 'contracts/location'

module ApplicationInsights
  module Channel
    # Represents a context for sending telemetry to the Application Insights service.
    class TelemetryContext
      # Initializes a new instance of the TelemetryContext class.
      def initialize
        @instrumentation_key = nil
        @application = Contracts::Application.new
        @device = Contracts::Device.new
        @user = Contracts::User.new
        @session = Contracts::Session.new
        @operation = Contracts::Operation.new
        @location = Contracts::Location.new
        @properties = {}
      end

      # Gets or sets the instrumentation key.
      attr_accessor :instrumentation_key

      # Gets or sets the application context.
      attr_accessor :application

      # Gets or sets the device context.
      attr_accessor :device

      # Gets or sets the user context.
      attr_accessor :user

      # Gets or sets the session context.
      attr_accessor :session

      # Gets or sets the operation context.
      attr_accessor :operation

      # Gets or sets the location context.
      attr_accessor :location

      # Gets a dictionary of application-defined property values.
      attr_reader :properties
    end
  end
end