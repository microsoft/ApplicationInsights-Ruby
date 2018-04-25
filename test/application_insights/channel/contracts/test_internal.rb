require_relative '../../../../lib/application_insights/channel/contracts/internal'
require 'test/unit'

include ApplicationInsights::Channel

class TestInternal < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Internal.new
    assert_not_nil item
  end

  def test_sdk_version_works_as_expected
    expected = 'fmwchHWF'
    item = Contracts::Internal.new
    item.sdk_version = expected
    actual = item.sdk_version
    assert_equal expected, actual
    expected = 'eqmowGLD'
    item.sdk_version = expected
    actual = item.sdk_version
    assert_equal expected, actual
  end

  def test_agent_version_works_as_expected
    expected = 'eMUeMREZ'
    item = Contracts::Internal.new
    item.agent_version = expected
    actual = item.agent_version
    assert_equal expected, actual
    expected = 'QkYKBHbG'
    item.agent_version = expected
    actual = item.agent_version
    assert_equal expected, actual
  end

  def test_node_name_works_as_expected
    expected = 'oYvZzjJA'
    item = Contracts::Internal.new
    item.node_name = expected
    actual = item.node_name
    assert_equal expected, actual
    expected = 'tfsjdFeA'
    item.node_name = expected
    actual = item.node_name
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Internal.new
    item.sdk_version = 'fmwchHWF'
    item.agent_version = 'eMUeMREZ'
    item.node_name = 'oYvZzjJA'
    actual = item.to_json
    expected = '{"ai.internal.sdkVersion":"fmwchHWF","ai.internal.agentVersion":"eMUeMREZ","ai.internal.nodeName":"oYvZzjJA"}'
    assert_equal expected, actual
  end
end
