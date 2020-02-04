require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_it_can_return_price
    house = House.new("$400000", "123 sugar lane")
    house2 = House.new("400000", "123 sugar lane")
    house3 = House.new(400000, "123 sugar lane")
    assert_equal 400000, house.price
    assert_equal 400000, house2.price
    assert_equal 400000, house3.price
  end

  def test_it_can_return_address
    house = House.new("$400000", "123 sugar lane")
    assert_equal "123 sugar lane", house.address
  end

  def test_it_can_add_rooms
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house = House.new("$400000", "123 sugar lane")
    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal [room_1, room_2], house.rooms
    assert_equal 2, house.rooms.length
  end

  def test_if_house_is_above_market_average
    house = House.new("$400000", "123 sugar lane")
    house2 = House.new("$600000", "123 sugar lane")
    house3 = House.new("$500000", "123 sugar lane")
    house4 = House.new("$500001", "123 sugar lane")
    assert_equal false, house.above_market_average?
    assert_equal true, house2.above_market_average?
    assert_equal false, house3.above_market_average?
    assert_equal true, house4.above_market_average?
  end

  def test_it_can_return_a_list_of_rooms_of_certain_category
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house = House.new("$400000", "123 sugar lane")
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
    assert_equal [room_4], house.rooms_from_category(:basement)
  end
end


# pry(main)> house.area
# #=> 1900
#
# pry(main)> house.details
# #=> {"price" => 400000, "address" => "123 sugar lane"}
