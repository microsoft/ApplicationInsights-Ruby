require_relative '../../../../lib/application_insights/channel/contracts/cloud'
require 'test/unit'

include ApplicationInsights::Channel

class TestCloud < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Cloud.new
    assert_not_nil item
  end

  def test_role_works_as_expected
    expected = 'xVvRTelh'
    item = Contracts::Cloud.new
    item.role = expected
    actual = item.role
    assert_equal expected, actual
    expected = 'ftVmPRMR'
    item.role = expected
    actual = item.role
    assert_equal expected, actual
  end

  def test_role_instance_works_as_expected
    expected = 'ouUssqtY'
    item = Contracts::Cloud.new
    item.role_instance = expected
    actual = item.role_instance
    assert_equal expected, actual
    expected = 'zeXpdMOC'
    item.role_instance = expected
    actual = item.role_instance
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Cloud.new
    item.role = 'xVvRTelh'
    item.role_instance = 'ouUssqtY'
    actual = item.to_json
    expected = '{"ai.cloud.role":"xVvRTelh","ai.cloud.roleInstance":"ouUssqtY"}'
    assert_equal expected, actual
  end
end
