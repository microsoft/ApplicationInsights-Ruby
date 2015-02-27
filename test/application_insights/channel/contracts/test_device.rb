require_relative '../../../../lib/application_insights/channel/contracts/device'
require 'test/unit'

include ApplicationInsights::Channel

class TestDevice < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Device.new
    assert_not_nil item
  end

  def test_id_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'Other string'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_ip_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.ip = expected
    actual = item.ip
    assert_equal expected, actual
    expected = 'Other string'
    item.ip = expected
    actual = item.ip
    assert_equal expected, actual
  end

  def test_language_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.language = expected
    actual = item.language
    assert_equal expected, actual
    expected = 'Other string'
    item.language = expected
    actual = item.language
    assert_equal expected, actual
  end

  def test_locale_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.locale = expected
    actual = item.locale
    assert_equal expected, actual
    expected = 'Other string'
    item.locale = expected
    actual = item.locale
    assert_equal expected, actual
  end

  def test_model_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.model = expected
    actual = item.model
    assert_equal expected, actual
    expected = 'Other string'
    item.model = expected
    actual = item.model
    assert_equal expected, actual
  end

  def test_network_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.network = expected
    actual = item.network
    assert_equal expected, actual
    expected = 'Other string'
    item.network = expected
    actual = item.network
    assert_equal expected, actual
  end

  def test_oem_name_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.oem_name = expected
    actual = item.oem_name
    assert_equal expected, actual
    expected = 'Other string'
    item.oem_name = expected
    actual = item.oem_name
    assert_equal expected, actual
  end

  def test_os_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.os = expected
    actual = item.os
    assert_equal expected, actual
    expected = 'Other string'
    item.os = expected
    actual = item.os
    assert_equal expected, actual
  end

  def test_os_version_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.os_version = expected
    actual = item.os_version
    assert_equal expected, actual
    expected = 'Other string'
    item.os_version = expected
    actual = item.os_version
    assert_equal expected, actual
  end

  def test_role_instance_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.role_instance = expected
    actual = item.role_instance
    assert_equal expected, actual
    expected = 'Other string'
    item.role_instance = expected
    actual = item.role_instance
    assert_equal expected, actual
  end

  def test_role_name_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.role_name = expected
    actual = item.role_name
    assert_equal expected, actual
    expected = 'Other string'
    item.role_name = expected
    actual = item.role_name
    assert_equal expected, actual
  end

  def test_screen_resolution_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.screen_resolution = expected
    actual = item.screen_resolution
    assert_equal expected, actual
    expected = 'Other string'
    item.screen_resolution = expected
    actual = item.screen_resolution
    assert_equal expected, actual
  end

  def test_type_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.type = expected
    actual = item.type
    assert_equal expected, actual
    expected = 'Other string'
    item.type = expected
    actual = item.type
    assert_equal expected, actual
  end

  def test_machine_name_works_as_expected
    expected = 'Test string'
    item = Contracts::Device.new
    item.machine_name = expected
    actual = item.machine_name
    assert_equal expected, actual
    expected = 'Other string'
    item.machine_name = expected
    actual = item.machine_name
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Device.new
    item.id = 'Test string'
    item.ip = 'Test string'
    item.language = 'Test string'
    item.locale = 'Test string'
    item.model = 'Test string'
    item.network = 'Test string'
    item.oem_name = 'Test string'
    item.os = 'Test string'
    item.os_version = 'Test string'
    item.role_instance = 'Test string'
    item.role_name = 'Test string'
    item.screen_resolution = 'Test string'
    item.type = 'Test string'
    item.machine_name = 'Test string'
    actual = item.to_json
    expected = '{"ai.device.id":"Test string","ai.device.ip":"Test string","ai.device.language":"Test string","ai.device.locale":"Test string","ai.device.model":"Test string","ai.device.network":"Test string","ai.device.oemName":"Test string","ai.device.os":"Test string","ai.device.osVersion":"Test string","ai.device.roleInstance":"Test string","ai.device.roleName":"Test string","ai.device.screenResolution":"Test string","ai.device.type":"Test string","ai.device.machineName":"Test string"}'
    assert_equal expected, actual
  end
end
