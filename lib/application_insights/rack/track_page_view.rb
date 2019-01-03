require 'rack'

module ApplicationInsights
  module Rack
    class TrackPageView
      attr_reader :app, :instrumentation_key

      def initialize(app, instrumentation_key)
        @app = app
        @instrumentation_key = instrumentation_key
      end

      def call(env)
        status, headers, response = app.call(env)

        content_type = headers['Content-Type']
        return [status, headers, response] unless content_type && content_type.include?('text/html')

        unless response.is_a?(::Rack::Response)
          response = ::Rack::Response.new(response, status, headers)
        end
        new_response = ::Rack::Response.new([], response.status, response.headers)
        response.body.each do |b|
          new_response.write(b.sub(/<\/head>/, "\n#{embedded_script_code}\n</head>"))
        end

        [new_response.status, new_response.headers, new_response]
      end

      private
      def embedded_script_code
        <<~"SCRIPT"
          <script type="text/javascript">
          var appInsights=window.appInsights||function(a){
            function b(a){c[a]=function(){var b=arguments;c.queue.push(function(){c[a].apply(c,b)})}}var c={config:a},d=document,e=window;setTimeout(function(){var b=d.createElement("script");b.src=a.url||"https://az416426.vo.msecnd.net/scripts/a/ai.0.js",d.getElementsByTagName("script")[0].parentNode.appendChild(b)});try{c.cookie=d.cookie}catch(a){}c.queue=[];for(var f=["Event","Exception","Metric","PageView","Trace","Dependency"];f.length;)b("track"+f.pop());if(b("setAuthenticatedUserContext"),b("clearAuthenticatedUserContext"),b("startTrackEvent"),b("stopTrackEvent"),b("startTrackPage"),b("stopTrackPage"),b("flush"),!a.disableExceptionTracking){f="onerror",b("_"+f);var g=e[f];e[f]=function(a,b,d,e,h){var i=g&&g(a,b,d,e,h);return!0!==i&&c["_"+f](a,b,d,e,h),i}}return c
            }({
                instrumentationKey:"#{instrumentation_key}"
            });

          window.appInsights=appInsights,appInsights.queue&&0===appInsights.queue.length&&appInsights.trackPageView();
          </script>
        SCRIPT
      end
    end
  end
end