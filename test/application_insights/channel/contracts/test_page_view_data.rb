require_relative '../../../../lib/application_insights/channel/contracts/page_view_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestPageViewData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::PageViewData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 42
    item = Contracts::PageViewData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 13
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_url_works_as_expected
    expected = 'Test string'
    item = Contracts::PageViewData.new
    item.url = expected
    actual = item.url
    assert_equal expected, actual
    expected = 'Other string'
    item.url = expected
    actual = item.url
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'Test string'
    item = Contracts::PageViewData.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'Other string'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_duration_works_as_expected
    expected = 'Test string'
    item = Contracts::PageViewData.new
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
    expected = 'Other string'
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
  end

  def test_properties_works_as_expected
    item = Contracts::PageViewData.new
    actual = item.properties
    assert_not_nil actual
  end

  def test_measurements_works_as_expected
    item = Contracts::PageViewData.new
    actual = item.measurements
    assert_not_nil actual
  end

  def test_to_json_works_as_expected
    item = Contracts::PageViewData.new
    item.ver = 42
    item.url = 'Test string'
    item.name = 'Test string'
    item.duration = 'Test string'
    { 'key1' => 'test value 1' , 'key2' => 'test value 2' }.each do |key, value|
      item.properties[key] = value
    end
    { 'key1' => 3.1415 , 'key2' => 42.2 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":42,"url":"Test string","name":"Test string","duration":"Test string","properties":{"key1":"test value 1","key2":"test value 2"},"measurements":{"key1":3.1415,"key2":42.2}}'
    assert_equal expected, actual
  end
end
