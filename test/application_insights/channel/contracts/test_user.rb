require_relative '../../../../lib/application_insights/channel/contracts/user'
require 'test/unit'

include ApplicationInsights::Channel

class TestUser < Test::Unit::TestCase
  def test_initialize
    item = Contracts::User.new
    assert_not_nil item
  end

  def test_account_id_works_as_expected
    expected = 'KvBXxURr'
    item = Contracts::User.new
    item.account_id = expected
    actual = item.account_id
    assert_equal expected, actual
    expected = 'GMHatHCH'
    item.account_id = expected
    actual = item.account_id
    assert_equal expected, actual
  end

  def test_id_works_as_expected
    expected = 'yqjDGfyE'
    item = Contracts::User.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'rPqqKNPC'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_auth_user_id_works_as_expected
    expected = 'VZITGWUe'
    item = Contracts::User.new
    item.auth_user_id = expected
    actual = item.auth_user_id
    assert_equal expected, actual
    expected = 'rkrAGTIC'
    item.auth_user_id = expected
    actual = item.auth_user_id
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::User.new
    item.account_id = 'KvBXxURr'
    item.id = 'yqjDGfyE'
    item.auth_user_id = 'VZITGWUe'
    actual = item.to_json
    expected = '{"ai.user.accountId":"KvBXxURr","ai.user.id":"yqjDGfyE","ai.user.authUserId":"VZITGWUe"}'
    assert_equal expected, actual
  end
end
