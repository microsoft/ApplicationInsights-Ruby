require_relative '../../../../lib/application_insights/channel/contracts/message_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestMessageData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::MessageData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 42
    item = Contracts::MessageData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 13
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_message_works_as_expected
    expected = 'Test string'
    item = Contracts::MessageData.new
    item.message = expected
    actual = item.message
    assert_equal expected, actual
    expected = 'Other string'
    item.message = expected
    actual = item.message
    assert_equal expected, actual
  end

  def test_severity_level_works_as_expected
    expected = 5
    item = Contracts::MessageData.new
    item.severity_level = expected
    actual = item.severity_level
    assert_equal expected, actual
    expected = 3
    item.severity_level = expected
    actual = item.severity_level
    assert_equal expected, actual
  end

  def test_properties_works_as_expected
    item = Contracts::MessageData.new
    actual = item.properties
    assert_not_nil actual
  end

  def test_to_json_works_as_expected
    item = Contracts::MessageData.new
    item.ver = 42
    item.message = 'Test string'
    item.severity_level = 5
    { 'key1' => 'test value 1' , 'key2' => 'test value 2' }.each do |key, value|
      item.properties[key] = value
    end
    actual = item.to_json
    expected = '{"ver":42,"message":"Test string","severityLevel":5,"properties":{"key1":"test value 1","key2":"test value 2"}}'
    assert_equal expected, actual
  end
end
