require 'test/unit'
require 'rack/mock'
require_relative '../../../lib/application_insights/rack/track_page_view'

include ApplicationInsights::Rack

class TestTrackPageView < Test::Unit::TestCase
  def test_embeds_tracking_script_into_html_content
    app = generate_dummy_app(body: <<-'BODY'
      <html>
        <head><title>dummy</title></head>
        <body>Hello, Application Insights!</body>
      </html>
    BODY
    )

    url = 'http://localhost:8080/hoge'
    env = Rack::MockRequest.env_for(url, method: 'GET')
    instrumentation_key = 'key'
    track_page_view = TrackPageView.new(app, instrumentation_key)

    status, _, result = track_page_view.call(env)

    assert_equal 200, status
    assert result.is_a?(::Rack::Response)
    assert result.body.first.include?(instrumentation_key)
  end

  def test_doesnt_embed_tracking_script_into_not_html
    app = generate_dummy_app(
      headers: {
        'Content-Type' => 'text/plain'
      },
      body: <<-'BODY'
        <html>
          <head><title>dummy</title></head>
          <body>Hello, Application Insights!</body>
        </html>
      BODY
    )

    url = 'http://localhost:8080/hoge'
    env = Rack::MockRequest.env_for(url, method: 'GET')
    instrumentation_key = 'key'
    track_page_view = TrackPageView.new(app, instrumentation_key)

    status, _, result = track_page_view.call(env)

    assert_equal 200, status
    assert !result.first.include?(instrumentation_key)
  end

  def test_embeds_tracking_script_when_any_method_and_status
    app = generate_dummy_app(
      status: 404,
      body: <<-'BODY'
        <html>
          <head><title>dummy</title></head>
          <body>Content Not Found</body>
        </html>
      BODY
    )

    url = 'http://localhost:8080/hoge'
    env = Rack::MockRequest.env_for(url, method: 'PUT')
    instrumentation_key = 'key'
    track_page_view = TrackPageView.new(app, instrumentation_key)

    status, _, result = track_page_view.call(env)

    assert_equal 404, status
    assert result.body.first.include?(instrumentation_key)
  end

  private
    def generate_dummy_app(status: 200, headers: {}, body:)
      unless headers.key?('Content-Type')
        headers['Content-Type'] = 'text/html'
      end

      Proc.new { |env| [status, headers, [body]]}
    end
end