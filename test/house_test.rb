require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'
require 'pry'

class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_it_has_price_and_address
    house = House.new("400000", "123 sugar lane")

    assert_equal 400000, house.price
  end

  def test_if_it_has_and_can_add_rooms
    house = House.new("400000", "123 sugar lane")

    assert_equal [], house.rooms

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal [room_1, room_2], house.rooms
  end

  def test_if_price_above_market_average
    house = House.new("400000", "123 sugar lane")

    assert_equal false, house.above_market_average?
  end

  def test_if_can_show_rooms_from_category
    house = House.new("400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
  end

end
