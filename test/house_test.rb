require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_it_has_price
    house = House.new("$400000", "123 sugar lane")
    assert_equal house.price, "$400000"
  end

  def test_it_has_address
    house = House.new("$400000", "123 sugar lane")
    assert_equal house.address, "123 sugar lane"
  end

  def test_it_has_rooms
    house = House.new("$400000", "123 sugar lane")
    assert_equal house.rooms, []
  end

  def test_can_we_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)
    assert_equal room_1, house.rooms[0]
    assert_equal room_2, house.rooms[1]
  end

  def test_is_it_above_market_average
    house = House.new("$400000", "123 sugar lane")
    assert_equal house.above_market_average?, false
  end

  def test_it_sorts_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal house.rooms_from_category(:bedroom), [room_1, room_2]
    assert_equal house.rooms_from_category(:basement), [room_4]
  end

end
