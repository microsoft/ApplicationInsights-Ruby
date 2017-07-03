require_relative '../../../../lib/application_insights/channel/contracts/internal'
require 'test/unit'

include ApplicationInsights::Channel

class TestInternal < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Internal.new
    assert_not_nil item
  end

  def test_sdk_version_works_as_expected
    expected = 'Test string'
    item = Contracts::Internal.new
    item.sdk_version = expected
    actual = item.sdk_version
    assert_equal expected, actual
    expected = 'Other string'
    item.sdk_version = expected
    actual = item.sdk_version
    assert_equal expected, actual
  end

  def test_agent_version_works_as_expected
    expected = 'Test string'
    item = Contracts::Internal.new
    item.agent_version = expected
    actual = item.agent_version
    assert_equal expected, actual
    expected = 'Other string'
    item.agent_version = expected
    actual = item.agent_version
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Internal.new
    item.sdk_version = 'Test string'
    item.agent_version = 'Test string'
    actual = item.to_json
    expected = '{"ai.internal.sdkVersion":"Test string","ai.internal.agentVersion":"Test string"}'
    assert_equal expected, actual
  end
end
