require_relative 'application_insights/telemetry_client'
require_relative 'application_insights/unhandled_exception'
require_relative 'application_insights/version'

module ApplicationInsights
  module Rack
    autoload :TrackRequest, "application_insights/rack/track_request"
    autoload :InjectJavaScriptTracking, "application_insights/rack/inject_java_script_tracking"
  end
end
