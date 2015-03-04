require_relative '../../../../lib/application_insights/channel/contracts/exception_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestExceptionData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::ExceptionData.new
    assert_not_nil item
  end
  
  def test_ver_works_as_expected
    expected = 42
    item = Contracts::ExceptionData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 13
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end
  
  def test_handled_at_works_as_expected
    expected = 'Test string'
    item = Contracts::ExceptionData.new
    item.handled_at = expected
    actual = item.handled_at
    assert_equal expected, actual
    expected = 'Other string'
    item.handled_at = expected
    actual = item.handled_at
    assert_equal expected, actual
  end
  
  def test_exceptions_works_as_expected
    item = Contracts::ExceptionData.new
    actual = item.exceptions
    assert_not_nil actual
  end
  
  def test_severity_level_works_as_expected
    expected = { 'key' => 'value' }
    item = Contracts::ExceptionData.new
    item.severity_level = expected
    actual = item.severity_level
    assert_equal expected, actual
    expected = { 'key' => 'value' }
    item.severity_level = expected
    actual = item.severity_level
    assert_equal expected, actual
  end
  
  def test_properties_works_as_expected
    item = Contracts::ExceptionData.new
    actual = item.properties
    assert_not_nil actual
  end
  
  def test_measurements_works_as_expected
    item = Contracts::ExceptionData.new
    actual = item.measurements
    assert_not_nil actual
  end
  
  def test_to_json_works_as_expected
    item = Contracts::ExceptionData.new
    item.ver = 42
    item.handled_at = 'Test string'
    [ { 'key' => 'value' } ].each do |value|
      item.exceptions.push value
    end
    
    item.severity_level = { 'key' => 'value' }
    { 'key1' => 'test value 1' , 'key2' => 'test value 2' }.each do |key, value|
      item.properties[key] = value
    end
    { 'key1' => 3.1415 , 'key2' => 42.2 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":42,"handledAt":"Test string","exceptions":[{"key":"value"}],"properties":{"key1":"test value 1","key2":"test value 2"},"measurements":{"key1":3.1415,"key2":42.2},"severityLevel":{"key":"value"}}'
    assert_equal expected, actual
  end
end
