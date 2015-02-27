require_relative '../../../../lib/application_insights/channel/contracts/data'
require 'test/unit'

include ApplicationInsights::Channel

class TestData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Data.new
    assert_not_nil item
  end

  def test_base_type_works_as_expected
    expected = 'Test string'
    item = Contracts::Data.new
    item.base_type = expected
    actual = item.base_type
    assert_equal expected, actual
    expected = 'Other string'
    item.base_type = expected
    actual = item.base_type
    assert_equal expected, actual
  end

  def test_base_data_works_as_expected
    expected = { 'key' => 'value' }
    item = Contracts::Data.new
    item.base_data = expected
    actual = item.base_data
    assert_equal expected, actual
    expected = { 'key' => 'value' }
    item.base_data = expected
    actual = item.base_data
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Data.new
    item.base_type = 'Test string'
    item.base_data = { 'key' => 'value' }
    actual = item.to_json
    expected = '{"baseType":"Test string","baseData":{"key":"value"}}'
    assert_equal expected, actual
  end
end
