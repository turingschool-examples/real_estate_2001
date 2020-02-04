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
  assert_equal "$400000", house.price
end

def test_it_has_address
  house = House.new("$400000", "123 sugar lane")
  assert_equal "123 sugar lane", house.address
end

def test_it_has_rooms
  house = House.new("$400000", "123 sugar lane")
  assert_equal [], house.rooms
end

def test_it_can_add_rooms
  house = House.new("$400000", "123 sugar lane")
  room1 = Room.new(:bedroom, 10, '13')
  room2 = Room.new(:living_room, 15, '12')
  house.add_room(room1)
  assert_equal 1, house.rooms.length
  house.add_room(room2)
  assert_equal 2 , house.rooms.length
end
end
