require_relative '../../../../lib/application_insights/channel/contracts/operation'
require 'test/unit'

include ApplicationInsights::Channel

class TestOperation < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Operation.new
    assert_not_nil item
  end

  def test_id_works_as_expected
    expected = 'xgpiibGZ'
    item = Contracts::Operation.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'AHBwRDsJ'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'Azjyxlyr'
    item = Contracts::Operation.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'XbRrfAgL'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_parent_id_works_as_expected
    expected = 'suDJVmiw'
    item = Contracts::Operation.new
    item.parent_id = expected
    actual = item.parent_id
    assert_equal expected, actual
    expected = 'FPKAsoNX'
    item.parent_id = expected
    actual = item.parent_id
    assert_equal expected, actual
  end

  def test_synthetic_source_works_as_expected
    expected = 'HoeKGdhh'
    item = Contracts::Operation.new
    item.synthetic_source = expected
    actual = item.synthetic_source
    assert_equal expected, actual
    expected = 'nmKPjenu'
    item.synthetic_source = expected
    actual = item.synthetic_source
    assert_equal expected, actual
  end

  def test_correlation_vector_works_as_expected
    expected = 'OtLgtpLh'
    item = Contracts::Operation.new
    item.correlation_vector = expected
    actual = item.correlation_vector
    assert_equal expected, actual
    expected = 'XcyzqKpA'
    item.correlation_vector = expected
    actual = item.correlation_vector
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Operation.new
    item.id = 'xgpiibGZ'
    item.name = 'Azjyxlyr'
    item.parent_id = 'suDJVmiw'
    item.synthetic_source = 'HoeKGdhh'
    item.correlation_vector = 'OtLgtpLh'
    actual = item.to_json
    expected = '{"ai.operation.id":"xgpiibGZ","ai.operation.name":"Azjyxlyr","ai.operation.parentId":"suDJVmiw","ai.operation.syntheticSource":"HoeKGdhh","ai.operation.correlationVector":"OtLgtpLh"}'
    assert_equal expected, actual
  end
end
