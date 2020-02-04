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

def test_if_above_market_average
  house1 = House.new("$400000", "123 sugar lane")
  house2 = House.new("$500001", "123 sugar lane")
  assert_equal false, house1.above_market_average?
  assert_equal true, house2.above_market_average?
end

def test_it_can_find_rooms_by_category
  house = House.new("$400000", "123 sugar lane")
  room1 = Room.new(:bedroom, 10, '13')
  room2 = Room.new(:living_room, 15, '12')
  room3 = Room.new(:living_room, 25, '15')
  room4 = Room.new(:basement, 30, '41')
  house.add_room(room1)
  house.add_room(room2)
  house.add_room(room3)
  house.add_room(room4)
  assert_equal 2, house.rooms_from_category(:living_room).length
  assert_equal 1, house.rooms_from_category(:bedroom).length
end

def test_it_calculates_house_area
  house = House.new("$400000", "123 sugar lane")
  room1 = Room.new(:bedroom, 10, '13')
  room2 = Room.new(:living_room, 15, '12')
  room3 = Room.new(:living_room, 25, '15')
  room4 = Room.new(:basement, 30, '41')
  house.add_room(room1)
  house.add_room(room2)
  house.add_room(room3)
  house.add_room(room4)
  assert_equal 1915.0, house.area
end

def test_it_provides_details
  house = House.new("$400000", "123 sugar lane")

end
end
