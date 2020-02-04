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
    house1 = House.new("$400000", "123 sugar lane")
    assert_equal [], house1.rooms

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')

    house.add_room(room1)
    house.add_room(room2)
    assert_equal [room1, room2],house1.rooms
  end
end
