require_relative '../../../../lib/application_insights/channel/contracts/exception_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestExceptionData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::ExceptionData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 31
    item = Contracts::ExceptionData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 79
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_exceptions_works_as_expected
    item = Contracts::ExceptionData.new
    actual = item.exceptions
    assert_not_nil actual
  end

  def test_severity_level_works_as_expected
    expected = 8
    item = Contracts::ExceptionData.new
    item.severity_level = expected
    actual = item.severity_level
    assert_equal expected, actual
    expected = 67
    item.severity_level = expected
    actual = item.severity_level
    assert_equal expected, actual
  end

  def test_problem_id_works_as_expected
    expected = 'jPyVAuhF'
    item = Contracts::ExceptionData.new
    item.problem_id = expected
    actual = item.problem_id
    assert_equal expected, actual
    expected = 'gnqJVAgN'
    item.problem_id = expected
    actual = item.problem_id
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
    item.ver = 31
    [ { 'key' => 'value' } ].each do |value|
      item.exceptions.push value
    end

    item.severity_level = 8
    item.problem_id = 'jPyVAuhF'
    { 'Tcep' => 'DaxVFHPr' }.each do |key, value|
      item.properties[key] = value
    end
    { 'kCvi' => 3.3344 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":31,"exceptions":[{"key":"value"}],"severityLevel":8,"problemId":"jPyVAuhF","properties":{"Tcep":"DaxVFHPr"},"measurements":{"kCvi":3.3344}}'
    assert_equal expected, actual
  end
end
