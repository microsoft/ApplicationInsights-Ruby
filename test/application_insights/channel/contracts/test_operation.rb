require_relative '../../../../lib/application_insights/channel/contracts/operation'
require 'test/unit'

include ApplicationInsights::Channel

class TestOperation < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Operation.new
    assert_not_nil item
  end

  def test_id_works_as_expected
    expected = 'Test string'
    item = Contracts::Operation.new
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
    item = Contracts::Operation.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'Other string'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_parent_id_works_as_expected
    expected = 'Test string'
    item = Contracts::Operation.new
    item.parent_id = expected
    actual = item.parent_id
    assert_equal expected, actual
    expected = 'Other string'
    item.parent_id = expected
    actual = item.parent_id
    assert_equal expected, actual
  end

  def test_root_id_works_as_expected
    expected = 'Test string'
    item = Contracts::Operation.new
    item.root_id = expected
    actual = item.root_id
    assert_equal expected, actual
    expected = 'Other string'
    item.root_id = expected
    actual = item.root_id
    assert_equal expected, actual
  end

  def test_synthetic_source_works_as_expected
    expected = 'Test string'
    item = Contracts::Operation.new
    item.synthetic_source = expected
    actual = item.synthetic_source
    assert_equal expected, actual
    expected = 'Other string'
    item.synthetic_source = expected
    actual = item.synthetic_source
    assert_equal expected, actual
  end

  def test_is_synthetic_works_as_expected
    expected = 'Test string'
    item = Contracts::Operation.new
    item.is_synthetic = expected
    actual = item.is_synthetic
    assert_equal expected, actual
    expected = 'Other string'
    item.is_synthetic = expected
    actual = item.is_synthetic
    assert_equal expected, actual
  end

  def test_correlation_vector_works_as_expected
    expected = 'Test string'
    item = Contracts::Operation.new
    item.correlation_vector = expected
    actual = item.correlation_vector
    assert_equal expected, actual
    expected = 'Other string'
    item.correlation_vector = expected
    actual = item.correlation_vector
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Operation.new
    item.id = 'Test string'
    item.name = 'Test string'
    item.parent_id = 'Test string'
    item.root_id = 'Test string'
    item.synthetic_source = 'Test string'
    item.is_synthetic = 'Test string'
    item.correlation_vector = 'Test string'
    actual = item.to_json
    expected = '{"ai.operation.id":"Test string","ai.operation.name":"Test string","ai.operation.parentId":"Test string","ai.operation.rootId":"Test string","ai.operation.syntheticSource":"Test string","ai.operation.isSynthetic":"Test string","ai.operation.correlationVector":"Test string"}'
    assert_equal expected, actual
  end
end
