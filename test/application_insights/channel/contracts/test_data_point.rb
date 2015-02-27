require_relative '../../../../lib/application_insights/channel/contracts/data_point'
require 'test/unit'

include ApplicationInsights::Channel

class TestDataPoint < Test::Unit::TestCase
  def test_initialize
    item = Contracts::DataPoint.new
    assert_not_nil item
  end

  def test_name_works_as_expected
    expected = 'Test string'
    item = Contracts::DataPoint.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'Other string'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_kind_works_as_expected
    expected = 5
    item = Contracts::DataPoint.new
    item.kind = expected
    actual = item.kind
    assert_equal expected, actual
    expected = 3
    item.kind = expected
    actual = item.kind
    assert_equal expected, actual
  end

  def test_value_works_as_expected
    expected = 1.5
    item = Contracts::DataPoint.new
    item.value = expected
    actual = item.value
    assert_equal expected, actual
    expected = 4.8
    item.value = expected
    actual = item.value
    assert_equal expected, actual
  end

  def test_count_works_as_expected
    expected = 42
    item = Contracts::DataPoint.new
    item.count = expected
    actual = item.count
    assert_equal expected, actual
    expected = 13
    item.count = expected
    actual = item.count
    assert_equal expected, actual
  end

  def test_min_works_as_expected
    expected = 1.5
    item = Contracts::DataPoint.new
    item.min = expected
    actual = item.min
    assert_equal expected, actual
    expected = 4.8
    item.min = expected
    actual = item.min
    assert_equal expected, actual
  end

  def test_max_works_as_expected
    expected = 1.5
    item = Contracts::DataPoint.new
    item.max = expected
    actual = item.max
    assert_equal expected, actual
    expected = 4.8
    item.max = expected
    actual = item.max
    assert_equal expected, actual
  end

  def test_std_dev_works_as_expected
    expected = 1.5
    item = Contracts::DataPoint.new
    item.std_dev = expected
    actual = item.std_dev
    assert_equal expected, actual
    expected = 4.8
    item.std_dev = expected
    actual = item.std_dev
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::DataPoint.new
    item.name = 'Test string'
    item.kind = 5
    item.value = 1.5
    item.count = 42
    item.min = 1.5
    item.max = 1.5
    item.std_dev = 1.5
    actual = item.to_json
    expected = '{"name":"Test string","kind":5,"value":1.5,"count":42,"min":1.5,"max":1.5,"stdDev":1.5}'
    assert_equal expected, actual
  end
end
