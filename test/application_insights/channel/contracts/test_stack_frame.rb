require_relative '../../../../lib/application_insights/channel/contracts/stack_frame'
require 'test/unit'

include ApplicationInsights::Channel

class TestStackFrame < Test::Unit::TestCase
  def test_initialize
    item = Contracts::StackFrame.new
    assert_not_nil item
  end

  def test_level_works_as_expected
    expected = 42
    item = Contracts::StackFrame.new
    item.level = expected
    actual = item.level
    assert_equal expected, actual
    expected = 13
    item.level = expected
    actual = item.level
    assert_equal expected, actual
  end

  def test_method_works_as_expected
    expected = 'Test string'
    item = Contracts::StackFrame.new
    item.method = expected
    actual = item.method
    assert_equal expected, actual
    expected = 'Other string'
    item.method = expected
    actual = item.method
    assert_equal expected, actual
  end

  def test_assembly_works_as_expected
    expected = 'Test string'
    item = Contracts::StackFrame.new
    item.assembly = expected
    actual = item.assembly
    assert_equal expected, actual
    expected = 'Other string'
    item.assembly = expected
    actual = item.assembly
    assert_equal expected, actual
  end

  def test_file_name_works_as_expected
    expected = 'Test string'
    item = Contracts::StackFrame.new
    item.file_name = expected
    actual = item.file_name
    assert_equal expected, actual
    expected = 'Other string'
    item.file_name = expected
    actual = item.file_name
    assert_equal expected, actual
  end

  def test_line_works_as_expected
    expected = 42
    item = Contracts::StackFrame.new
    item.line = expected
    actual = item.line
    assert_equal expected, actual
    expected = 13
    item.line = expected
    actual = item.line
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::StackFrame.new
    item.level = 42
    item.method = 'Test string'
    item.assembly = 'Test string'
    item.file_name = 'Test string'
    item.line = 42
    actual = item.to_json
    expected = '{"level":42,"method":"Test string","assembly":"Test string","fileName":"Test string","line":42}'
    assert_equal expected, actual
  end
end
