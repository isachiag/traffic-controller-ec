require 'test/unit'
require_relative 'main'

class TestTrafficController < Test::Unit::TestCase

  def setup
    @tc = TrafficController.new
    @car_0 = Car.new 1234560
    @car_1 = Car.new 1234561
    @car_2 = Car.new 1234562
    @car_3 = Car.new 1234563
    @car_4 = Car.new 1234564
  end
 
  def test_can_be_on_the_road
    assert_equal(true,  @tc.can_be_on_the_road?(@car_1, '2016-10-11', '16:30'))
    assert_equal(true,  @tc.can_be_on_the_road?(@car_2, '2016-10-11', '10:30'))
    assert_equal(true,  @tc.can_be_on_the_road?(@car_2, '2016-10-10', '10:30'))
    assert_equal(true,  @tc.can_be_on_the_road?(@car_0, '2016-10-10', '10:30'))
    assert_equal(true,  @tc.can_be_on_the_road?(@car_4, '2016-10-11', '15:00'))
  end

  def test_can_not_be_on_the_road
    assert_equal(false, @tc.can_be_on_the_road?(@car_3, '2016-10-11', '16:3' ))
    assert_equal(false, @tc.can_be_on_the_road?(@car_4, '2016-10-11', '7:00' ))
  end
 
end
