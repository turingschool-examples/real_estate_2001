require "minitest/autorun"
require "minitest/pride"
require "./lib/house"
require "./lib/room"

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_has_attributes
    house1 = House.new("$400000", "123 sugar lane")

    assert_equal 400000, house.price
    assert_equal "123 sugar lane", house1.address
    assert_equal [], house1.rooms
  end

  def test_can_add_rooms
    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    house = House.new("$400000", "123 sugar lane")

    house1.add_room(room1)
    house1.add_room(room2)

    assert_equal [room1, room2], house.rooms
  end

  def test_returns_above_market_average
    house1 = House.new("$400000", "123 sugar lane")
    house2 = House.new("$600000", "123 sesame street")

    assert_equal false, house1.above_market_average?
    assert_equal true, house2.above_market_average?
  end

  def test_finds_rooms_from_category
    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')
    house1 = House.new("$400000", "123 sugar lane")

    house1.add_room(room1)
    house1.add_room(room2)
    house1.add_room(room3)
    house1.add_room(room4)

    assert_equal [room1, room2], house.rooms_from_category(:bedroom)
    assert_equal [room4], house.rooms_from_category(:basement)
  end

  def test_calculates_house_area
    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')
    house = House.new("$400000", "123 sugar lane")

    house1.add_room(room1)
    house1.add_room(room2)
    house1.add_room(room3)
    house1.add_room(room4)

    assert_equal 1900, house.area
  end

  def test_returns_house_details
    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')
    house1 = House.new("$400000", "123 sugar lane")

    house1.add_room(room1)
    house1.add_room(room2)
    house1.add_room(room3)
    house1.add_room(room4)


    expected_details = {
      "price" => 400000,
      "address" => "123 sugar lane"
    }

    assert_equal expected_details, house1.details
  end
end
