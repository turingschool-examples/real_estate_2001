require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < MiniTest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_houses_exist
    assert_instance_of House, @house
  end

  def test_houses_have_prices
    assert_equal 400000, @house.price
  end

  def test_houses_have_addresses
    assert_equal "123 sugar lane", @house.address
  end

  def test_houses_have_rooms
    assert_equal [], @house.rooms
  end

  def test_rooms_can_be_added_to_houses
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_house_is_above_market_average_if_worth_more_than_500000
    assert_equal false, @house.above_market_average?
  end

  def test_rooms_can_retrieved_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_house_area_can_be_retrieved
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 1900, @house.area
  end

  def test_all_house_details_can_be_retrieved
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal ({"price" => 400000, "address" => "123 sugar lane"}), @house.details
  end
end
