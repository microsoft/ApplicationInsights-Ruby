require_relative '../../../../lib/application_insights/channel/contracts/data_point'
require 'test/unit'

include ApplicationInsights::Channel

class TestDataPoint < Test::Unit::TestCase
  def test_initialize
    item = Contracts::DataPoint.new
    assert_not_nil item
  end

  def test_ns_works_as_expected
    expected = 'jDBZQtSX'
    item = Contracts::DataPoint.new
    item.ns = expected
    actual = item.ns
    assert_equal expected, actual
    expected = 'FrKumsuy'
    item.ns = expected
    actual = item.ns
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'ILuHEzWe'
    item = Contracts::DataPoint.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'DamjApTx'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_kind_works_as_expected
    expected = 89
    item = Contracts::DataPoint.new
    item.kind = expected
    actual = item.kind
    assert_equal expected, actual
    expected = 69
    item.kind = expected
    actual = item.kind
    assert_equal expected, actual
  end

  def test_value_works_as_expected
    expected = 0.6264
    item = Contracts::DataPoint.new
    item.value = expected
    actual = item.value
    assert_equal expected, actual
    expected = 1.322
    item.value = expected
    actual = item.value
    assert_equal expected, actual
  end

  def test_count_works_as_expected
    expected = 92
    item = Contracts::DataPoint.new
    item.count = expected
    actual = item.count
    assert_equal expected, actual
    expected = 10
    item.count = expected
    actual = item.count
    assert_equal expected, actual
  end

  def test_min_works_as_expected
    expected = 0.597
    item = Contracts::DataPoint.new
    item.min = expected
    actual = item.min
    assert_equal expected, actual
    expected = 3.8705
    item.min = expected
    actual = item.min
    assert_equal expected, actual
  end

  def test_max_works_as_expected
    expected = 3.0309
    item = Contracts::DataPoint.new
    item.max = expected
    actual = item.max
    assert_equal expected, actual
    expected = 4.215
    item.max = expected
    actual = item.max
    assert_equal expected, actual
  end

  def test_std_dev_works_as_expected
    expected = 8.2776
    item = Contracts::DataPoint.new
    item.std_dev = expected
    actual = item.std_dev
    assert_equal expected, actual
    expected = 4.9077
    item.std_dev = expected
    actual = item.std_dev
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::DataPoint.new
    item.ns = 'jDBZQtSX'
    item.name = 'ILuHEzWe'
    item.kind = 89
    item.value = 0.6264
    item.count = 92
    item.min = 0.597
    item.max = 3.0309
    item.std_dev = 8.2776
    actual = item.to_json
    expected = '{"ns":"jDBZQtSX","name":"ILuHEzWe","kind":89,"value":0.6264,"count":92,"min":0.597,"max":3.0309,"stdDev":8.2776}'
    assert_equal expected, actual
  end
end
