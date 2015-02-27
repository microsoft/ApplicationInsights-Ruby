require_relative '../../../../lib/application_insights/channel/contracts/envelope'
require 'test/unit'

include ApplicationInsights::Channel

class TestEnvelope < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Envelope.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 42
    item = Contracts::Envelope.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 13
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'Other string'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_time_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.time = expected
    actual = item.time
    assert_equal expected, actual
    expected = 'Other string'
    item.time = expected
    actual = item.time
    assert_equal expected, actual
  end

  def test_sample_rate_works_as_expected
    expected = 1.5
    item = Contracts::Envelope.new
    item.sample_rate = expected
    actual = item.sample_rate
    assert_equal expected, actual
    expected = 4.8
    item.sample_rate = expected
    actual = item.sample_rate
    assert_equal expected, actual
  end

  def test_seq_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.seq = expected
    actual = item.seq
    assert_equal expected, actual
    expected = 'Other string'
    item.seq = expected
    actual = item.seq
    assert_equal expected, actual
  end

  def test_i_key_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.i_key = expected
    actual = item.i_key
    assert_equal expected, actual
    expected = 'Other string'
    item.i_key = expected
    actual = item.i_key
    assert_equal expected, actual
  end

  def test_flags_works_as_expected
    expected = 42
    item = Contracts::Envelope.new
    item.flags = expected
    actual = item.flags
    assert_equal expected, actual
    expected = 13
    item.flags = expected
    actual = item.flags
    assert_equal expected, actual
  end

  def test_device_id_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.device_id = expected
    actual = item.device_id
    assert_equal expected, actual
    expected = 'Other string'
    item.device_id = expected
    actual = item.device_id
    assert_equal expected, actual
  end

  def test_os_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.os = expected
    actual = item.os
    assert_equal expected, actual
    expected = 'Other string'
    item.os = expected
    actual = item.os
    assert_equal expected, actual
  end

  def test_os_ver_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.os_ver = expected
    actual = item.os_ver
    assert_equal expected, actual
    expected = 'Other string'
    item.os_ver = expected
    actual = item.os_ver
    assert_equal expected, actual
  end

  def test_app_id_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.app_id = expected
    actual = item.app_id
    assert_equal expected, actual
    expected = 'Other string'
    item.app_id = expected
    actual = item.app_id
    assert_equal expected, actual
  end

  def test_app_ver_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.app_ver = expected
    actual = item.app_ver
    assert_equal expected, actual
    expected = 'Other string'
    item.app_ver = expected
    actual = item.app_ver
    assert_equal expected, actual
  end

  def test_user_id_works_as_expected
    expected = 'Test string'
    item = Contracts::Envelope.new
    item.user_id = expected
    actual = item.user_id
    assert_equal expected, actual
    expected = 'Other string'
    item.user_id = expected
    actual = item.user_id
    assert_equal expected, actual
  end

  def test_tags_works_as_expected
    item = Contracts::Envelope.new
    actual = item.tags
    assert_not_nil actual
  end

  def test_data_works_as_expected
    expected = { 'key' => 'value' }
    item = Contracts::Envelope.new
    item.data = expected
    actual = item.data
    assert_equal expected, actual
    expected = { 'key' => 'value' }
    item.data = expected
    actual = item.data
    assert_equal expected, actual
  end

  def test_to_json_works_as_expected
    item = Contracts::Envelope.new
    item.ver = 42
    item.name = 'Test string'
    item.time = 'Test string'
    item.sample_rate = 1.5
    item.seq = 'Test string'
    item.i_key = 'Test string'
    item.flags = 42
    item.device_id = 'Test string'
    item.os = 'Test string'
    item.os_ver = 'Test string'
    item.app_id = 'Test string'
    item.app_ver = 'Test string'
    item.user_id = 'Test string'
    { 'key1' => 'test value 1' , 'key2' => 'test value 2' }.each do |key, value|
      item.tags[key] = value
    end
    item.data = { 'key' => 'value' }
    actual = item.to_json
    expected = '{"ver":42,"name":"Test string","time":"Test string","sampleRate":1.5,"seq":"Test string","iKey":"Test string","flags":42,"deviceId":"Test string","os":"Test string","osVer":"Test string","appId":"Test string","appVer":"Test string","userId":"Test string","tags":{"key1":"test value 1","key2":"test value 2"},"data":{"key":"value"}}'
    assert_equal expected, actual
  end
end
