require_relative '../../../../lib/application_insights/channel/contracts/availability_data'
require 'test/unit'

include ApplicationInsights::Channel

class TestAvailabilityData < Test::Unit::TestCase
  def test_initialize
    item = Contracts::AvailabilityData.new
    assert_not_nil item
  end

  def test_ver_works_as_expected
    expected = 60
    item = Contracts::AvailabilityData.new
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
    expected = 31
    item.ver = expected
    actual = item.ver
    assert_equal expected, actual
  end

  def test_id_works_as_expected
    expected = 'RpFcQvQE'
    item = Contracts::AvailabilityData.new
    item.id = expected
    actual = item.id
    assert_equal expected, actual
    expected = 'cxoRhoau'
    item.id = expected
    actual = item.id
    assert_equal expected, actual
  end

  def test_name_works_as_expected
    expected = 'zQBYaqQb'
    item = Contracts::AvailabilityData.new
    item.name = expected
    actual = item.name
    assert_equal expected, actual
    expected = 'uHoMIRvK'
    item.name = expected
    actual = item.name
    assert_equal expected, actual
  end

  def test_duration_works_as_expected
    expected = 'NyxpMJyX'
    item = Contracts::AvailabilityData.new
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
    expected = 'pJxuCsyu'
    item.duration = expected
    actual = item.duration
    assert_equal expected, actual
  end

  def test_success_works_as_expected
    expected = TRUE
    item = Contracts::AvailabilityData.new
    item.success = expected
    actual = item.success
    assert_equal expected, actual
    expected = FALSE
    item.success = expected
    actual = item.success
    assert_equal expected, actual
  end

  def test_run_location_works_as_expected
    expected = 'KUVHiBWZ'
    item = Contracts::AvailabilityData.new
    item.run_location = expected
    actual = item.run_location
    assert_equal expected, actual
    expected = 'XXgBHdTA'
    item.run_location = expected
    actual = item.run_location
    assert_equal expected, actual
  end

  def test_message_works_as_expected
    expected = 'igFdqfxl'
    item = Contracts::AvailabilityData.new
    item.message = expected
    actual = item.message
    assert_equal expected, actual
    expected = 'KFGmgAzg'
    item.message = expected
    actual = item.message
    assert_equal expected, actual
  end

  def test_properties_works_as_expected
    item = Contracts::AvailabilityData.new
    actual = item.properties
    assert_not_nil actual
  end

  def test_measurements_works_as_expected
    item = Contracts::AvailabilityData.new
    actual = item.measurements
    assert_not_nil actual
  end

  def test_to_json_works_as_expected
    item = Contracts::AvailabilityData.new
    item.ver = 60
    item.id = 'RpFcQvQE'
    item.name = 'zQBYaqQb'
    item.duration = 'NyxpMJyX'
    item.success = TRUE
    item.run_location = 'KUVHiBWZ'
    item.message = 'igFdqfxl'
    { 'GtPP' => 'RNyTculM' }.each do |key, value|
      item.properties[key] = value
    end
    { 'IzDw' => 2.4493 }.each do |key, value|
      item.measurements[key] = value
    end
    actual = item.to_json
    expected = '{"ver":60,"id":"RpFcQvQE","name":"zQBYaqQb","duration":"NyxpMJyX","success":true,"runLocation":"KUVHiBWZ","message":"igFdqfxl","properties":{"GtPP":"RNyTculM"},"measurements":{"IzDw":2.4493}}'
    assert_equal expected, actual
  end
end
