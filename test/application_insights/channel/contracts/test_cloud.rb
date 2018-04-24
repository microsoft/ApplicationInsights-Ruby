require_relative '../../../../lib/application_insights/channel/contracts/cloud'
require 'test/unit'

include ApplicationInsights::Channel

class TestCloud < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Cloud.new
    assert_not_nil item
  end

  def test_role_name_works_as_expected
    expected = 'Test string'
    item = Contracts::Cloud.new
    item.role_name = expected
    actual = item.role_name
    assert_equal expected, actual
    expected = 'Other string'
    item.role_name = expected
    actual = item.role_name
    assert_equal expected, actual
  end

  def test_role_instance_works_as_expected
    expected = 'Test string'
    item = Contracts::Cloud.new
    item.role_instance = expected
    actual = item.role_instance
    assert_equal expected, actual
    expected = 'Other string'
    item.role_instance = expected
    actual = item.role_instance
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Cloud.new
    item.role_name = 'Role name'
    item.role_instance = 'Role instance'
    actual = item.to_json
    expected = '{"ai.cloud.role":"Role name","ai.cloud.roleInstance":"Role instance"}'
    assert_equal expected, actual
  end
end
