require_relative '../../../../lib/application_insights/channel/contracts/location'
require 'test/unit'

include ApplicationInsights::Channel

class TestLocation < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Location.new
    assert_not_nil item
  end

  def test_ip_works_as_expected
    expected = 'Test string'
    item = Contracts::Location.new
    item.ip = expected
    actual = item.ip
    assert_equal expected, actual
    expected = 'Other string'
    item.ip = expected
    actual = item.ip
    assert_equal expected, actual
  end

  def test_country_works_as_expected
    expected = 'Test string'
    item = Contracts::Location.new
    item.country = expected
    actual = item.country
    assert_equal expected, actual
    expected = 'Other string'
    item.country = expected
    actual = item.country
    assert_equal expected, actual
  end

  def test_province_works_as_expected
    expected = 'Test string'
    item = Contracts::Location.new
    item.province = expected
    actual = item.province
    assert_equal expected, actual
    expected = 'Other string'
    item.province = expected
    actual = item.province
    assert_equal expected, actual
  end

  def test_city_works_as_expected
    expected = 'Test string'
    item = Contracts::Location.new
    item.city = expected
    actual = item.city
    assert_equal expected, actual
    expected = 'Other string'
    item.city = expected
    actual = item.city
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Location.new
    item.ip = 'Test string'
    item.country = 'US'
    item.province = 'WA'
    item.city = 'Redmond'
    actual = item.to_json
    expected = '{"ai.location.ip":"Test string","ai.location.country":"US","ai.location.province":"WA","ai.location.city":"Redmond"}'
    assert_equal expected, actual
  end
end
