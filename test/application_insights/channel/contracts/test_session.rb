require_relative '../../../../lib/application_insights/channel/contracts/session'
require 'test/unit'

include ApplicationInsights::Channel

class TestSession < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Session.new
    assert_not_nil item
  end

  def test_id_works_as_expected
    expected = 'loQoJqjW'
    item = Contracts::Session.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'wqzRpTBu'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_is_first_works_as_expected
    expected = 'XoyYwPiz'
    item = Contracts::Session.new
    item.is_first = expected
    actual = item.is_first
    assert_equal expected, actual
    expected = 'hZyQkrHb'
    item.is_first = expected
    actual = item.is_first
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Session.new
    item.id = 'loQoJqjW'
    item.is_first = 'XoyYwPiz'
    actual = item.to_json
    expected = '{"ai.session.id":"loQoJqjW","ai.session.isFirst":"XoyYwPiz"}'
    assert_equal expected, actual
  end
end
