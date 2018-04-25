require_relative '../../../../lib/application_insights/channel/contracts/location'
require 'test/unit'

include ApplicationInsights::Channel

class TestLocation < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Location.new
    assert_not_nil item
  end

  def test_ip_works_as_expected
    expected = 'hmrnPNLx'
    item = Contracts::Location.new
    item.ip = expected
    actual = item.ip
    assert_equal expected, actual
    expected = 'WjNsWtwq'
    item.ip = expected
    actual = item.ip
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Location.new
    item.ip = 'hmrnPNLx'
    actual = item.to_json
    expected = '{"ai.location.ip":"hmrnPNLx"}'
    assert_equal expected, actual
  end
end
