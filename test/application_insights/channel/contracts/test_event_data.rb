require_relative '../../../../lib/application_insights/channel/contracts/event_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestEventData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::EventData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 42
    item = Contracts::EventData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 13
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'Test string'
    item = Contracts::EventData.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'Other string'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_properties_works_as_expected
    item = Contracts::EventData.new
    actual = item.properties
    assert_not_nil actual
  end

  def test_measurements_works_as_expected
    item = Contracts::EventData.new
    actual = item.measurements
    assert_not_nil actual
  end

  def test_to_json_works_as_expected
    item = Contracts::EventData.new
    item.ver = 42
    item.name = 'Test string'
    { 'key1' => 'test value 1' , 'key2' => 'test value 2' }.each do |key, value|
      item.properties[key] = value
    end
    { 'key1' => 3.1415 , 'key2' => 42.2 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":42,"name":"Test string","properties":{"key1":"test value 1","key2":"test value 2"},"measurements":{"key1":3.1415,"key2":42.2}}'
    assert_equal expected, actual
  end
end
