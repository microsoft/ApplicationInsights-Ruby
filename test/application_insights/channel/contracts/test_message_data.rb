require_relative '../../../../lib/application_insights/channel/contracts/message_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestMessageData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::MessageData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 38
    item = Contracts::MessageData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 92
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_message_works_as_expected
    expected = 'cYQXvzXJ'
    item = Contracts::MessageData.new
    item.message = expected
    actual = item.message
    assert_equal expected, actual
    expected = 'ULhtEnAd'
    item.message = expected
    actual = item.message
    assert_equal expected, actual
  end

  def test_severity_level_works_as_expected
    expected = 91
    item = Contracts::MessageData.new
    item.severity_level = expected
    actual = item.severity_level
    assert_equal expected, actual
    expected = 30
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
    item.ver = 38
    item.message = 'cYQXvzXJ'
    item.severity_level = 91
    { 'yCBA' => 'KevMpBvm' }.each do |key, value|
      item.properties[key] = value
    end
    actual = item.to_json
    expected = '{"ver":38,"message":"cYQXvzXJ","severityLevel":91,"properties":{"yCBA":"KevMpBvm"}}'
    assert_equal expected, actual
  end
end
