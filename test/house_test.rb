require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'


class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_it_has_a_price
    house1 = House.new("$400000", "123 sugar lane")
    assert_equal 400000, house1.price

    house2 = House.new("250000", "124 sugar lane")
    assert_equal 250000, house2.price
  end

  def test_it_has_an_address
    house1 = House.new("$400000", "123 sugar lane")
    assert_equal "123 sugar lane", house1.address

    house2 = House.new("250000", "999 Other Way")
    assert_equal "999 Other Way", house2.address
  end

  def test_it_has_rooms
    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')

    house.add_room(room1)
    house.add_room(room2)
    assert_equal [room1, room2],house.rooms
  end

  def test_if_it_is_above_market_average
    house1 = House.new("$600000", "123 ABC Lane")
    assert_equal true, house1.above_market_average?

    house2 = House.new("$400000", "123 sugar lane")
    assert_equal false, house2.above_market_average?
  end

  def test_get_rooms_from_category
    house = House.new("$400000", "123 sugar lane")

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')

    house.add_room(room1)
    house.add_room(room2)
    house.add_room(room3)
    house.add_room(room4)

    assert_equal [room1, room2], house.rooms_from_category(:bedroom)
    assert_equal [room4], house.rooms_from_category(:basement)
  end

  def test_it_has_area
    house = House.new("$400000", "123 sugar lane")
    assert_equal 0, house.area

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')

    house.add_room(room1)
    house.add_room(room2)
    house.add_room(room3)
    house.add_room(room4)
    assert_equal 1900, house.area
  end

  def test_it_has_details
    house = House.new("$400000", "123 sugar lane")
    details = {"price" => 400000, "address" => "123 sugar lane"}

    assert_equal details, house.details
  end

  def test_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    assert_equal 0, house.price_per_square_foot

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')

    house.add_room(room1)
    house.add_room(room2)
    house.add_room(room3)
    house.add_room(room4)

    assert_equal 210.53, house.price_per_square_foot
  end

  def test_sorted_by_area
    house = House.new("$400000", "123 sugar lane")

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')

    house.add_room(room1)
    house.add_room(room2)
    house.add_room(room3)
    house.add_room(room4)

    largest_to_smallest_room = [room4, room3, room2, room1]
    assert_equal largest_to_smallest_room, house.rooms_sorted_by_area
  end
end
