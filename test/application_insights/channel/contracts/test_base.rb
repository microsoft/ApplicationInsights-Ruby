require_relative '../../../../lib/application_insights/channel/contracts/base'
require 'test/unit'

include ApplicationInsights::Channel

class TestBase < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Base.new
    assert_not_nil item
  end

  def test_base_type_works_as_expected
    expected = 'DkiuYcvD'
    item = Contracts::Base.new
    item.base_type = expected
    actual = item.base_type
    assert_equal expected, actual
    expected = 'cMlRgUYh'
    item.base_type = expected
    actual = item.base_type
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Base.new
    item.base_type = 'DkiuYcvD'
    actual = item.to_json
    expected = '{"baseType":"DkiuYcvD"}'
    assert_equal expected, actual
  end
end
