require_relative '../../../../lib/application_insights/channel/contracts/request_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestRequestData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::RequestData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 44
    item = Contracts::RequestData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 53
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_id_works_as_expected
    expected = 'MgQDgnwj'
    item = Contracts::RequestData.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'ZQLhHKEQ'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_source_works_as_expected
    expected = 'dgIPCOqW'
    item = Contracts::RequestData.new
    item.source = expected
    actual = item.source
    assert_equal expected, actual
    expected = 'bNniMOzG'
    item.source = expected
    actual = item.source
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'IpbmDRHR'
    item = Contracts::RequestData.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'NMfahvIU'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_duration_works_as_expected
    expected = 'pWJMqvrn'
    item = Contracts::RequestData.new
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
    expected = 'sxFglGld'
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
  end

  def test_response_code_works_as_expected
    expected = 'HbsJtlrO'
    item = Contracts::RequestData.new
    item.response_code = expected
    actual = item.response_code
    assert_equal expected, actual
    expected = 'owSqbWQM'
    item.response_code = expected
    actual = item.response_code
    assert_equal expected, actual
  end

  def test_success_works_as_expected
    expected = FALSE
    item = Contracts::RequestData.new
    item.success = expected
    actual = item.success
    assert_equal expected, actual
    expected = TRUE
    item.success = expected
    actual = item.success
    assert_equal expected, actual
  end

  def test_url_works_as_expected
    expected = 'uZuDIKVi'
    item = Contracts::RequestData.new
    item.url = expected
    actual = item.url
    assert_equal expected, actual
    expected = 'IrDHfhEX'
    item.url = expected
    actual = item.url
    assert_equal expected, actual
  end

  def test_properties_works_as_expected
    item = Contracts::RequestData.new
    actual = item.properties
    assert_not_nil actual
  end

  def test_measurements_works_as_expected
    item = Contracts::RequestData.new
    actual = item.measurements
    assert_not_nil actual
  end

  def test_to_json_works_as_expected
    item = Contracts::RequestData.new
    item.ver = 44
    item.id = 'MgQDgnwj'
    item.source = 'dgIPCOqW'
    item.name = 'IpbmDRHR'
    item.duration = 'pWJMqvrn'
    item.response_code = 'HbsJtlrO'
    item.success = FALSE
    item.url = 'uZuDIKVi'
    { 'KAbR' => 'LoRanEpP' }.each do |key, value|
      item.properties[key] = value
    end
    { 'GTJR' => 3.9199 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":44,"id":"MgQDgnwj","source":"dgIPCOqW","name":"IpbmDRHR","duration":"pWJMqvrn","responseCode":"HbsJtlrO","success":false,"url":"uZuDIKVi","properties":{"KAbR":"LoRanEpP"},"measurements":{"GTJR":3.9199}}'
    assert_equal expected, actual
  end
end
