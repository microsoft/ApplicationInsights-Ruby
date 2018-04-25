require_relative '../../../../lib/application_insights/channel/contracts/envelope'
require 'test/unit'

include ApplicationInsights::Channel

class TestEnvelope < Test::Unit::TestCase
  def test_initialize
    item = Contracts::Envelope.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 80
    item = Contracts::Envelope.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 38
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'adlchSLC'
    item = Contracts::Envelope.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'BoywoCzj'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_time_works_as_expected
    expected = 'rdfJJhQs'
    item = Contracts::Envelope.new
    item.time = expected
    actual = item.time
    assert_equal expected, actual
    expected = 'zotVaJNt'
    item.time = expected
    actual = item.time
    assert_equal expected, actual
  end

  def test_sample_rate_works_as_expected
    expected = 4.3706
    item = Contracts::Envelope.new
    item.sample_rate = expected
    actual = item.sample_rate
    assert_equal expected, actual
    expected = 9.2301
    item.sample_rate = expected
    actual = item.sample_rate
    assert_equal expected, actual
  end

  def test_seq_works_as_expected
    expected = 'rCitVJLQ'
    item = Contracts::Envelope.new
    item.seq = expected
    actual = item.seq
    assert_equal expected, actual
    expected = 'eTUUGRJV'
    item.seq = expected
    actual = item.seq
    assert_equal expected, actual
  end

  def test_i_key_works_as_expected
    expected = 'siOxfiva'
    item = Contracts::Envelope.new
    item.i_key = expected
    actual = item.i_key
    assert_equal expected, actual
    expected = 'mhrUZzEP'
    item.i_key = expected
    actual = item.i_key
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
    item.ver = 80
    item.name = 'adlchSLC'
    item.time = 'rdfJJhQs'
    item.sample_rate = 4.3706
    item.seq = 'rCitVJLQ'
    item.i_key = 'siOxfiva'
    { 'rMCx' => 'bZQsOeRE' }.each do |key, value|
      item.tags[key] = value
    end
    item.data = { 'key' => 'value' }
    actual = item.to_json
    expected = '{"ver":80,"name":"adlchSLC","time":"rdfJJhQs","sampleRate":4.3706,"seq":"rCitVJLQ","iKey":"siOxfiva","tags":{"rMCx":"bZQsOeRE"},"data":{"key":"value"}}'
    assert_equal expected, actual
  end
end
