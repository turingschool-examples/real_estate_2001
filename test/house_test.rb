require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'


class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_house_has_attributes
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal ([]), @house.rooms
  end

  def test_house_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_price_can_be_covereted_using_commas
    assert_equal "$400,000", @house.add_commas_to_price("$400000")
  end

  def test_house_is_above_or_below_market_average_price
    house_1 = House.new("$400000", "123 sugar lane")
    refute house_1.above_market_price?
    house_2 =  House.new("$600000", "123 sugar lane")
    assert house_2.above_market_price?
  end

  def test_house_can_list_rooms_from_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal ([@room_1, @room_2]), @house.rooms_from_category(:bedroom)
    assert_equal ([@room_4]), @house.rooms_from_category(:basement)
  end
end
