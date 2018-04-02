require_relative '../../../lib/application_insights/channel/telemetry_context'
require 'test/unit'

include ApplicationInsights::Channel

class TestTelemetryContext < Test::Unit::TestCase
  def test_initialize
    context = TelemetryContext.new
    assert_nil context.instrumentation_key
    assert_not_nil context.application
    assert_not_nil context.device
    assert_not_nil context.user
    assert_not_nil context.session
    assert_not_nil context.operation
    assert_not_nil context.location
    assert_not_nil context.properties
  end

  def test_application_works_as_expected
    context = TelemetryContext.new
    assert_not_nil context.application
    expected = Contracts::Application.new
    context.application = expected
    assert_same expected, context.application
  end

  def test_cloud_works_as_expected
    context = TelemetryContext.new
    assert_not_nil context.cloud
    expected = Contracts::Cloud.new
    context.cloud = expected
    assert_same expected, context.cloud
  end

  def test_device_works_as_expected
    context = TelemetryContext.new
    assert_not_nil context.device
    expected = Contracts::Device.new
    context.device = expected
    assert_same expected, context.device
  end

  def test_user_works_as_expected
    context = TelemetryContext.new
    assert_not_nil context.user
    expected = Contracts::User.new
    context.user = expected
    assert_same expected, context.user
  end

  def test_session_works_as_expected
    context = TelemetryContext.new
    assert_not_nil context.session
    expected = Contracts::Session.new
    context.session = expected
    assert_same expected, context.session
  end

  def test_operation_works_as_expected
    context = TelemetryContext.new
    assert_not_nil context.operation
    expected = Contracts::Operation.new
    context.operation = expected
    assert_same expected, context.operation
  end

  def test_location_works_as_expected
    context = TelemetryContext.new
    assert_not_nil context.location
    expected = Contracts::Location.new
    context.location = expected
    assert_same expected, context.location
  end

  def test_properties_works_as_expected
    context = TelemetryContext.new
    assert_not_nil context.properties
    assert_equal 0, context.properties.count
    expected = {:a => 'a', :b => 'b'}
    context.properties = expected
    assert_same expected, context.properties
  end
end