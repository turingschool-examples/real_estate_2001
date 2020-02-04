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

  def test_house_attributes
    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

  def test_house_can_add_rooms
    assert_equal [], @house.rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal 2, @house.rooms.size
    assert_instance_of Room, @house.rooms[0]
    assert_instance_of Room, @house.rooms[1]
    assert_equal :bedroom, @house.rooms[0].category
  end

  def test_if_house_is_above_market_average
    refute @house.above_market_average?
  end

  def test_rooms_from_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 2, @house.rooms_from_category(:bedroom).size
    assert_equal :bedroom, @house.rooms_from_category(:bedroom).first.category
    assert_equal :basement, @house.rooms_from_category(:basement).first.category
  end

  def test_house_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end

  def test_house_details
    assert_equal Hash["price", 400000, "address", "123 sugar lane"], @house.details
  end
end
