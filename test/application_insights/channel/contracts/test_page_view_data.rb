require_relative '../../../../lib/application_insights/channel/contracts/page_view_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestPageViewData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::PageViewData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 63
    item = Contracts::PageViewData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 21
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_url_works_as_expected
    expected = 'nxcKNxAq'
    item = Contracts::PageViewData.new
    item.url = expected
    actual = item.url
    assert_equal expected, actual
    expected = 'bjKAYrGi'
    item.url = expected
    actual = item.url
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'FPkYRwor'
    item = Contracts::PageViewData.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'mwxmSpxU'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_duration_works_as_expected
    expected = 'WaazkJXv'
    item = Contracts::PageViewData.new
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
    expected = 'NjcZUfcw'
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
  end

  def test_id_works_as_expected
    expected = 'wXTUMDUP'
    item = Contracts::PageViewData.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'cgSQSTiU'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_referrer_uri_works_as_expected
    expected = 'xatkciOm'
    item = Contracts::PageViewData.new
    item.referrer_uri = expected
    actual = item.referrer_uri
    assert_equal expected, actual
    expected = 'RDgezsNB'
    item.referrer_uri = expected
    actual = item.referrer_uri
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
    item.ver = 63
    item.url = 'nxcKNxAq'
    item.name = 'FPkYRwor'
    item.duration = 'WaazkJXv'
    item.id = 'wXTUMDUP'
    item.referrer_uri = 'xatkciOm'
    { 'fEUK' => 'CmlXfTfm' }.each do |key, value|
      item.properties[key] = value
    end
    { 'WxIM' => 4.509 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":63,"url":"nxcKNxAq","name":"FPkYRwor","duration":"WaazkJXv","id":"wXTUMDUP","referrerUri":"xatkciOm","properties":{"fEUK":"CmlXfTfm"},"measurements":{"WxIM":4.509}}'
    assert_equal expected, actual
  end
end
