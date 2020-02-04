require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require './lib/room'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
  end

  def test_it_exists

    assert_instance_of House, @house
  end

  def test_it_has_a_price

    assert_equal "$400000", @house.price
  end

  def test_it_has_an_address

    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_rooms

    assert_equal [], @house.rooms
  end

  def test_it_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1, @room_2], @house.rooms
  end
  
  def test_it_is_above_market?

    assert_equal false, @house.above_market?
  end
end
