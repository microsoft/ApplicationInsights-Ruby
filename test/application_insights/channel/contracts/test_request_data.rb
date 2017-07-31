require_relative '../../../../lib/application_insights/channel/contracts/request_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestRequestData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::RequestData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 42
    item = Contracts::RequestData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 13
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_id_works_as_expected
    expected = 'Test string'
    item = Contracts::RequestData.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'Other string'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'Test string'
    item = Contracts::RequestData.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'Other string'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_start_time_works_as_expected
    expected = 'Test string'
    item = Contracts::RequestData.new
    item.start_time = expected
    actual = item.start_time
    assert_equal expected, actual
    expected = 'Other string'
    item.start_time = expected
    actual = item.start_time
    assert_equal expected, actual
  end

  def test_duration_works_as_expected
    expected = 'Test string'
    item = Contracts::RequestData.new
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
    expected = 'Other string'
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
  end

  def test_response_code_works_as_expected
    expected = 'Test string'
    item = Contracts::RequestData.new
    item.response_code = expected
    actual = item.response_code
    assert_equal expected, actual
    expected = 'Other string'
    item.response_code = expected
    actual = item.response_code
    assert_equal expected, actual
  end

  def test_success_works_as_expected
    expected = true
    item = Contracts::RequestData.new
    item.success = expected
    actual = item.success
    assert_equal expected, actual
    expected = false
    item.success = expected
    actual = item.success
    assert_equal expected, actual
  end

  def test_http_method_works_as_expected
    expected = 'Test string'
    item = Contracts::RequestData.new
    item.http_method = expected
    actual = item.http_method
    assert_equal expected, actual
    expected = 'Other string'
    item.http_method = expected
    actual = item.http_method
    assert_equal expected, actual
  end

  def test_url_works_as_expected
    expected = 'Test string'
    item = Contracts::RequestData.new
    item.url = expected
    actual = item.url
    assert_equal expected, actual
    expected = 'Other string'
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
    item.ver = 42
    item.id = 'Test string'
    item.name = 'Test string'
    item.start_time = 'Test string'
    item.duration = 'Test string'
    item.response_code = 'Test string'
    item.success = true
    item.http_method = 'Test string'
    item.url = 'Test string'
    { 'key1' => 'test value 1' , 'key2' => 'test value 2' }.each do |key, value|
      item.properties[key] = value
    end
    { 'key1' => 3.1415 , 'key2' => 42.2 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":42,"id":"Test string","name":"Test string","startTime":"Test string","duration":"Test string","responseCode":"Test string","success":true,"httpMethod":"Test string","url":"Test string","properties":{"key1":"test value 1","key2":"test value 2"},"measurements":{"key1":3.1415,"key2":42.2}}'
    assert_equal expected, actual
  end
end
