require_relative '../../../../lib/application_insights/channel/contracts/device'
require 'test/unit'

include ApplicationInsights::Channel

class TestDevice < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Device.new
    assert_not_nil item
  end

  def test_id_works_as_expected
    expected = 'ELCIfeDG'
    item = Contracts::Device.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'cOztzrST'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_locale_works_as_expected
    expected = 'aXkpqBWw'
    item = Contracts::Device.new
    item.locale = expected
    actual = item.locale
    assert_equal expected, actual
    expected = 'CiVQEdxZ'
    item.locale = expected
    actual = item.locale
    assert_equal expected, actual
  end

  def test_model_works_as_expected
    expected = 'mkBCkkHm'
    item = Contracts::Device.new
    item.model = expected
    actual = item.model
    assert_equal expected, actual
    expected = 'DxVrFmpS'
    item.model = expected
    actual = item.model
    assert_equal expected, actual
  end

  def test_oem_name_works_as_expected
    expected = 'EazNnals'
    item = Contracts::Device.new
    item.oem_name = expected
    actual = item.oem_name
    assert_equal expected, actual
    expected = 'cvKMXLfr'
    item.oem_name = expected
    actual = item.oem_name
    assert_equal expected, actual
  end

  def test_os_version_works_as_expected
    expected = 'cQgvEEEr'
    item = Contracts::Device.new
    item.os_version = expected
    actual = item.os_version
    assert_equal expected, actual
    expected = 'EETihAgX'
    item.os_version = expected
    actual = item.os_version
    assert_equal expected, actual
  end

  def test_type_works_as_expected
    expected = 'ElWvwXNQ'
    item = Contracts::Device.new
    item.type = expected
    actual = item.type
    assert_equal expected, actual
    expected = 'ZPYQpwGr'
    item.type = expected
    actual = item.type
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Device.new
    item.id = 'ELCIfeDG'
    item.locale = 'aXkpqBWw'
    item.model = 'mkBCkkHm'
    item.oem_name = 'EazNnals'
    item.os_version = 'cQgvEEEr'
    item.type = 'ElWvwXNQ'
    actual = item.to_json
    expected = '{"ai.device.id":"ELCIfeDG","ai.device.locale":"aXkpqBWw","ai.device.model":"mkBCkkHm","ai.device.oemName":"EazNnals","ai.device.osVersion":"cQgvEEEr","ai.device.type":"ElWvwXNQ"}'
    assert_equal expected, actual
  end
end
