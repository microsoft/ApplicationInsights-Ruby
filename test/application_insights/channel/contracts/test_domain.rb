require_relative '../../../../lib/application_insights/channel/contracts/domain'
require 'test/unit'

include ApplicationInsights::Channel

class TestDomain < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Domain.new
    assert_not_nil item
  end

  def test_to_json_works_as_expected
    item = Contracts::Domain.new
    actual = item.to_json
    expected = '{}'
    assert_equal expected, actual
  end
end
