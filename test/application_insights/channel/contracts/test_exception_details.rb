require_relative '../../../../lib/application_insights/channel/contracts/exception_details'
require 'test/unit'

include ApplicationInsights::Channel

class TestExceptionDetails < Test::Unit::TestCase
  def test_initialize
    item = Contracts::ExceptionDetails.new
    assert_not_nil item
  end

  def test_id_works_as_expected
    expected = 42
    item = Contracts::ExceptionDetails.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 13
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_outer_id_works_as_expected
    expected = 42
    item = Contracts::ExceptionDetails.new
    item.outer_id = expected
    actual = item.outer_id
    assert_equal expected, actual
    expected = 13
    item.outer_id = expected
    actual = item.outer_id
    assert_equal expected, actual
  end

  def test_type_name_works_as_expected
    expected = 'Test string'
    item = Contracts::ExceptionDetails.new
    item.type_name = expected
    actual = item.type_name
    assert_equal expected, actual
    expected = 'Other string'
    item.type_name = expected
    actual = item.type_name
    assert_equal expected, actual
  end

  def test_message_works_as_expected
    expected = 'Test string'
    item = Contracts::ExceptionDetails.new
    item.message = expected
    actual = item.message
    assert_equal expected, actual
    expected = 'Other string'
    item.message = expected
    actual = item.message
    assert_equal expected, actual
  end

  def test_has_full_stack_works_as_expected
    expected = true
    item = Contracts::ExceptionDetails.new
    item.has_full_stack = expected
    actual = item.has_full_stack
    assert_equal expected, actual
    expected = false
    item.has_full_stack = expected
    actual = item.has_full_stack
    assert_equal expected, actual
  end

  def test_stack_works_as_expected
    expected = 'Test string'
    item = Contracts::ExceptionDetails.new
    item.stack = expected
    actual = item.stack
    assert_equal expected, actual
    expected = 'Other string'
    item.stack = expected
    actual = item.stack
    assert_equal expected, actual
  end

  def test_parsed_stack_works_as_expected
    item = Contracts::ExceptionDetails.new
    actual = item.parsed_stack
    assert_not_nil actual
  end

  def test_to_json_works_as_expected
    item = Contracts::ExceptionDetails.new
    item.id = 42
    item.outer_id = 42
    item.type_name = 'Test string'
    item.message = 'Test string'
    item.has_full_stack = true
    item.stack = 'Test string'
    [ { 'key' => 'value' } ].each do |value|
      item.parsed_stack.push value
    end

    actual = item.to_json
    expected = '{"id":42,"outerId":42,"typeName":"Test string","message":"Test string","hasFullStack":true,"stack":"Test string","parsedStack":[{"key":"value"}]}'
    assert_equal expected, actual
  end
end
