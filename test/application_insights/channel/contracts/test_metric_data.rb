require_relative '../../../../lib/application_insights/channel/contracts/metric_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestMetricData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::MetricData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 42
    item = Contracts::MetricData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 13
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_metrics_works_as_expected
    item = Contracts::MetricData.new
    actual = item.metrics
    assert_not_nil actual
  end

  def test_properties_works_as_expected
    item = Contracts::MetricData.new
    actual = item.properties
    assert_not_nil actual
  end

  def test_to_json_works_as_expected
    item = Contracts::MetricData.new
    item.ver = 42
    [ { 'key' => 'value' } ].each do |value|
      item.metrics.push value
    end

    { 'key1' => 'test value 1' , 'key2' => 'test value 2' }.each do |key, value|
      item.properties[key] = value
    end
    actual = item.to_json
    expected = '{"ver":42,"metrics":[{"key":"value"}],"properties":{"key1":"test value 1","key2":"test value 2"}}'
    assert_equal expected, actual
  end
end
