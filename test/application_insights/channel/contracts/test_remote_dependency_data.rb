require_relative '../../../../lib/application_insights/channel/contracts/remote_dependency_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestRemoteDependencyData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::RemoteDependencyData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 60
    item = Contracts::RemoteDependencyData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 92
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'ImFOjAtD'
    item = Contracts::RemoteDependencyData.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'xXicyvLb'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_id_works_as_expected
    expected = 'OEyKTSXC'
    item = Contracts::RemoteDependencyData.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'BGyiNivx'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_result_code_works_as_expected
    expected = 'RRBLmlBX'
    item = Contracts::RemoteDependencyData.new
    item.result_code = expected
    actual = item.result_code
    assert_equal expected, actual
    expected = 'eTppvBwT'
    item.result_code = expected
    actual = item.result_code
    assert_equal expected, actual
  end

  def test_duration_works_as_expected
    expected = 'qsFxgsJU'
    item = Contracts::RemoteDependencyData.new
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
    expected = 'vmAnrvkN'
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
  end

  def test_success_works_as_expected
    expected = FALSE
    item = Contracts::RemoteDependencyData.new
    item.success = expected
    actual = item.success
    assert_equal expected, actual
    expected = TRUE
    item.success = expected
    actual = item.success
    assert_equal expected, actual
  end

  def test_data_works_as_expected
    expected = 'NbtmHjWq'
    item = Contracts::RemoteDependencyData.new
    item.data = expected
    actual = item.data
    assert_equal expected, actual
    expected = 'CqhRgUsx'
    item.data = expected
    actual = item.data
    assert_equal expected, actual
  end

  def test_target_works_as_expected
    expected = 'MlNaqxPw'
    item = Contracts::RemoteDependencyData.new
    item.target = expected
    actual = item.target
    assert_equal expected, actual
    expected = 'yUXiGybP'
    item.target = expected
    actual = item.target
    assert_equal expected, actual
  end

  def test_type_works_as_expected
    expected = 'yvCcYRVC'
    item = Contracts::RemoteDependencyData.new
    item.type = expected
    actual = item.type
    assert_equal expected, actual
    expected = 'lSKNVkCA'
    item.type = expected
    actual = item.type
    assert_equal expected, actual
  end

  def test_properties_works_as_expected
    item = Contracts::RemoteDependencyData.new
    actual = item.properties
    assert_not_nil actual
  end

  def test_measurements_works_as_expected
    item = Contracts::RemoteDependencyData.new
    actual = item.measurements
    assert_not_nil actual
  end

  def test_to_json_works_as_expected
    item = Contracts::RemoteDependencyData.new
    item.ver = 60
    item.name = 'ImFOjAtD'
    item.id = 'OEyKTSXC'
    item.result_code = 'RRBLmlBX'
    item.duration = 'qsFxgsJU'
    item.success = FALSE
    item.data = 'NbtmHjWq'
    item.target = 'MlNaqxPw'
    item.type = 'yvCcYRVC'
    { 'dpeP' => 'BBXyWyVy' }.each do |key, value|
      item.properties[key] = value
    end
    { 'srjL' => 0.262 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":60,"name":"ImFOjAtD","id":"OEyKTSXC","resultCode":"RRBLmlBX","duration":"qsFxgsJU","success":false,"data":"NbtmHjWq","target":"MlNaqxPw","type":"yvCcYRVC","properties":{"dpeP":"BBXyWyVy"},"measurements":{"srjL":0.262}}'
    assert_equal expected, actual
  end
end
