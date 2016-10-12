require_relative '../../../../lib/application_insights/channel/contracts/session'
require 'test/unit'

include ApplicationInsights::Channel

class TestSession < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Session.new
    assert_not_nil item
  end

  def test_id_works_as_expected
    expected = 'Test string'
    item = Contracts::Session.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'Other string'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_is_first_works_as_expected
    expected = 'Test string'
    item = Contracts::Session.new
    item.is_first = expected
    actual = item.is_first
    assert_equal expected, actual
    expected = 'Other string'
    item.is_first = expected
    actual = item.is_first
    assert_equal expected, actual
  end

  def test_is_new_works_as_expected
    expected = 'Test string'
    item = Contracts::Session.new
    item.is_new = expected
    actual = item.is_new
    assert_equal expected, actual
    expected = 'Other string'
    item.is_new = expected
    actual = item.is_new
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Session.new
    item.id = 'Test string'
    item.is_first = 'Test string'
    item.is_new = 'Test string'
    actual = item.to_json
    expected = '{"ai.session.id":"Test string","ai.session.isFirst":"Test string","ai.session.isNew":"Test string"}'
    assert_equal expected, actual
  end
end
