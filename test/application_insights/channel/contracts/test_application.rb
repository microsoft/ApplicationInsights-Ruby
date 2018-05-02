require_relative '../../../../lib/application_insights/channel/contracts/application'
require 'test/unit'

include ApplicationInsights::Channel

class TestApplication < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Application.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 'GLvyAJsZ'
    item = Contracts::Application.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 'eMtJfeXF'
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Application.new
    item.ver = 'GLvyAJsZ'
    actual = item.to_json
    expected = '{"ai.application.ver":"GLvyAJsZ"}'
    assert_equal expected, actual
  end
end
