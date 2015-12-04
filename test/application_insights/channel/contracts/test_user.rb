require_relative '../../../../lib/application_insights/channel/contracts/user'
require 'test/unit'

include ApplicationInsights::Channel

class TestUser < Test::Unit::TestCase
  def test_initialize
    item = Contracts::User.new
    assert_not_nil item
  end

  def test_account_acquisition_date_works_as_expected
    expected = 'Test string'
    item = Contracts::User.new
    item.account_acquisition_date = expected
    actual = item.account_acquisition_date
    assert_equal expected, actual
    expected = 'Other string'
    item.account_acquisition_date = expected
    actual = item.account_acquisition_date
    assert_equal expected, actual
  end

  def test_account_id_works_as_expected
    expected = 'Test string'
    item = Contracts::User.new
    item.account_id = expected
    actual = item.account_id
    assert_equal expected, actual
    expected = 'Other string'
    item.account_id = expected
    actual = item.account_id
    assert_equal expected, actual
  end

  def test_user_agent_works_as_expected
    expected = 'Test string'
    item = Contracts::User.new
    item.user_agent = expected
    actual = item.user_agent
    assert_equal expected, actual
    expected = 'Other string'
    item.user_agent = expected
    actual = item.user_agent
    assert_equal expected, actual
  end

  def test_id_works_as_expected
    expected = 'Test string'
    item = Contracts::User.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'Other string'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_user_auth_id_as_expected
    expected = 'Test string'
    item = Contracts::User.new
    item.auth_user_id = expected
    actual = item.auth_user_id
    assert_equal expected, actual
    expected = 'Other string'
    item.auth_user_id = expected
    actual = item.auth_user_id
    assert_equal expected, actual
  end

  def test_store_region_works_as_expected
    expected = 'Test string'
    item = Contracts::User.new
    item.store_region = expected
    actual = item.store_region
    assert_equal expected, actual
    expected = 'Other string'
    item.store_region = expected
    actual = item.store_region
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::User.new
    item.account_acquisition_date = 'Test string'
    item.account_id = 'Test string'
    item.user_agent = 'Test string'
    item.id = 'Test string'
    item.store_region = 'Test string'
    item.auth_user_id = 'Test string'
    actual = item.to_json
    expected = '{"ai.user.accountAcquisitionDate":"Test string","ai.user.accountId":"Test string","ai.user.userAgent":"Test string","ai.user.id":"Test string","ai.user.authUserId":"Test string","ai.user.storeRegion":"Test string"}'
    assert_equal expected, actual
  end
end
