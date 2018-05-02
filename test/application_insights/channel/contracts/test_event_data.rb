require_relative '../../../../lib/application_insights/channel/contracts/event_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestEventData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::EventData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 63
    item = Contracts::EventData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 21
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'FPkYRwor'
    item = Contracts::EventData.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'mwxmSpxU'
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
    item.ver = 63
    item.name = 'FPkYRwor'
    { 'fEUK' => 'CmlXfTfm' }.each do |key, value|
      item.properties[key] = value
    end
    { 'WxIM' => 4.509 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":63,"name":"FPkYRwor","properties":{"fEUK":"CmlXfTfm"},"measurements":{"WxIM":4.509}}'
    assert_equal expected, actual
  end
end
