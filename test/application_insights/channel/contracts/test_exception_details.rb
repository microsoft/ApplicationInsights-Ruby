require_relative '../../../../lib/application_insights/channel/contracts/exception_details'
require 'test/unit'

include ApplicationInsights::Channel

class TestExceptionDetails < Test::Unit::TestCase
  def test_initialize
    item = Contracts::ExceptionDetails.new
    assert_not_nil item
  end

  def test_id_works_as_expected
    expected = 98
    item = Contracts::ExceptionDetails.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 57
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_outer_id_works_as_expected
    expected = 27
    item = Contracts::ExceptionDetails.new
    item.outer_id = expected
    actual = item.outer_id
    assert_equal expected, actual
    expected = 51
    item.outer_id = expected
    actual = item.outer_id
    assert_equal expected, actual
  end

  def test_type_name_works_as_expected
    expected = 'tqoEGGgl'
    item = Contracts::ExceptionDetails.new
    item.type_name = expected
    actual = item.type_name
    assert_equal expected, actual
    expected = 'WYBOaGPb'
    item.type_name = expected
    actual = item.type_name
    assert_equal expected, actual
  end

  def test_message_works_as_expected
    expected = 'qThIpXfu'
    item = Contracts::ExceptionDetails.new
    item.message = expected
    actual = item.message
    assert_equal expected, actual
    expected = 'xqpwFlLr'
    item.message = expected
    actual = item.message
    assert_equal expected, actual
  end

  def test_has_full_stack_works_as_expected
    expected = TRUE
    item = Contracts::ExceptionDetails.new
    item.has_full_stack = expected
    actual = item.has_full_stack
    assert_equal expected, actual
    expected = FALSE
    item.has_full_stack = expected
    actual = item.has_full_stack
    assert_equal expected, actual
  end

  def test_stack_works_as_expected
    expected = 'fLmysXWS'
    item = Contracts::ExceptionDetails.new
    item.stack = expected
    actual = item.stack
    assert_equal expected, actual
    expected = 'HxcveEPO'
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
    item.id = 98
    item.outer_id = 27
    item.type_name = 'tqoEGGgl'
    item.message = 'qThIpXfu'
    item.has_full_stack = TRUE
    item.stack = 'fLmysXWS'
    [ { 'key' => 'value' } ].each do |value|
      item.parsed_stack.push value
    end

    actual = item.to_json
    expected = '{"id":98,"outerId":27,"typeName":"tqoEGGgl","message":"qThIpXfu","hasFullStack":true,"stack":"fLmysXWS","parsedStack":[{"key":"value"}]}'
    assert_equal expected, actual
  end
end
