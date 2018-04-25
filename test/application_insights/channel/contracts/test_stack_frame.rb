require_relative '../../../../lib/application_insights/channel/contracts/stack_frame'
require 'test/unit'

include ApplicationInsights::Channel

class TestStackFrame < Test::Unit::TestCase
  def test_initialize
    item = Contracts::StackFrame.new
    assert_not_nil item
  end

  def test_level_works_as_expected
    expected = 37
    item = Contracts::StackFrame.new
    item.level = expected
    actual = item.level
    assert_equal expected, actual
    expected = 27
    item.level = expected
    actual = item.level
    assert_equal expected, actual
  end

  def test_method_works_as_expected
    expected = 'EkQgDpPN'
    item = Contracts::StackFrame.new
    item.method = expected
    actual = item.method
    assert_equal expected, actual
    expected = 'PfRZhlsX'
    item.method = expected
    actual = item.method
    assert_equal expected, actual
  end

  def test_assembly_works_as_expected
    expected = 'GxIJFkxm'
    item = Contracts::StackFrame.new
    item.assembly = expected
    actual = item.assembly
    assert_equal expected, actual
    expected = 'QYXvOpuB'
    item.assembly = expected
    actual = item.assembly
    assert_equal expected, actual
  end

  def test_file_name_works_as_expected
    expected = 'RmInsZZW'
    item = Contracts::StackFrame.new
    item.file_name = expected
    actual = item.file_name
    assert_equal expected, actual
    expected = 'nFMPfcAe'
    item.file_name = expected
    actual = item.file_name
    assert_equal expected, actual
  end

  def test_line_works_as_expected
    expected = 78
    item = Contracts::StackFrame.new
    item.line = expected
    actual = item.line
    assert_equal expected, actual
    expected = 83
    item.line = expected
    actual = item.line
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::StackFrame.new
    item.level = 37
    item.method = 'EkQgDpPN'
    item.assembly = 'GxIJFkxm'
    item.file_name = 'RmInsZZW'
    item.line = 78
    actual = item.to_json
    expected = '{"level":37,"method":"EkQgDpPN","assembly":"GxIJFkxm","fileName":"RmInsZZW","line":78}'
    assert_equal expected, actual
  end
end
