require_relative '../../../../lib/application_insights/channel/contracts/page_view_perf_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestPageViewPerfData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::PageViewPerfData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 63
    item = Contracts::PageViewPerfData.new
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
    item = Contracts::PageViewPerfData.new
    item.url = expected
    actual = item.url
    assert_equal expected, actual
    expected = 'bjKAYrGi'
    item.url = expected
    actual = item.url
    assert_equal expected, actual
  end

  def test_perf_total_works_as_expected
    expected = 'jItXKRPj'
    item = Contracts::PageViewPerfData.new
    item.perf_total = expected
    actual = item.perf_total
    assert_equal expected, actual
    expected = 'UTJiZJzM'
    item.perf_total = expected
    actual = item.perf_total
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'FPkYRwor'
    item = Contracts::PageViewPerfData.new
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
    item = Contracts::PageViewPerfData.new
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
    expected = 'NjcZUfcw'
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
  end

  def test_network_connect_works_as_expected
    expected = 'zkjWxHlP'
    item = Contracts::PageViewPerfData.new
    item.network_connect = expected
    actual = item.network_connect
    assert_equal expected, actual
    expected = 'xTSQXzFa'
    item.network_connect = expected
    actual = item.network_connect
    assert_equal expected, actual
  end

  def test_sent_request_works_as_expected
    expected = 'CeetTzfH'
    item = Contracts::PageViewPerfData.new
    item.sent_request = expected
    actual = item.sent_request
    assert_equal expected, actual
    expected = 'bpEapcOu'
    item.sent_request = expected
    actual = item.sent_request
    assert_equal expected, actual
  end

  def test_received_response_works_as_expected
    expected = 'ZhZDxeDE'
    item = Contracts::PageViewPerfData.new
    item.received_response = expected
    actual = item.received_response
    assert_equal expected, actual
    expected = 'rssHVaMn'
    item.received_response = expected
    actual = item.received_response
    assert_equal expected, actual
  end

  def test_id_works_as_expected
    expected = 'wXTUMDUP'
    item = Contracts::PageViewPerfData.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'cgSQSTiU'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_dom_processing_works_as_expected
    expected = 'GWUjOWso'
    item = Contracts::PageViewPerfData.new
    item.dom_processing = expected
    actual = item.dom_processing
    assert_equal expected, actual
    expected = 'HgOuCeTT'
    item.dom_processing = expected
    actual = item.dom_processing
    assert_equal expected, actual
  end

  def test_referrer_uri_works_as_expected
    expected = 'xatkciOm'
    item = Contracts::PageViewPerfData.new
    item.referrer_uri = expected
    actual = item.referrer_uri
    assert_equal expected, actual
    expected = 'RDgezsNB'
    item.referrer_uri = expected
    actual = item.referrer_uri
    assert_equal expected, actual
  end

  def test_properties_works_as_expected
    item = Contracts::PageViewPerfData.new
    actual = item.properties
    assert_not_nil actual
  end

  def test_measurements_works_as_expected
    item = Contracts::PageViewPerfData.new
    actual = item.measurements
    assert_not_nil actual
  end

  def test_to_json_works_as_expected
    item = Contracts::PageViewPerfData.new
    item.ver = 63
    item.url = 'nxcKNxAq'
    item.perf_total = 'jItXKRPj'
    item.name = 'FPkYRwor'
    item.duration = 'WaazkJXv'
    item.network_connect = 'zkjWxHlP'
    item.sent_request = 'CeetTzfH'
    item.received_response = 'ZhZDxeDE'
    item.id = 'wXTUMDUP'
    item.dom_processing = 'GWUjOWso'
    item.referrer_uri = 'xatkciOm'
    { 'fEUK' => 'CmlXfTfm' }.each do |key, value|
      item.properties[key] = value
    end
    { 'WxIM' => 4.509 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":63,"url":"nxcKNxAq","perfTotal":"jItXKRPj","name":"FPkYRwor","duration":"WaazkJXv","networkConnect":"zkjWxHlP","sentRequest":"CeetTzfH","receivedResponse":"ZhZDxeDE","id":"wXTUMDUP","domProcessing":"GWUjOWso","referrerUri":"xatkciOm","properties":{"fEUK":"CmlXfTfm"},"measurements":{"WxIM":4.509}}'
    assert_equal expected, actual
  end
end
