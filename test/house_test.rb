require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < MiniTest::Test
  def setup
    @house = House.new('$400000', '123 sugar lane')
    @room1 = Room.new(:bedroom, 10, '13')
    @room2 = Room.new(:bedroom, 11, '15')
  end

  def test_it_exists_with_attributes
    assert_instance_of House, @house
    assert_equal 400_000, @house.price
    assert_equal '123 sugar lane', @house.address
  end

  def test_it_starts_no_rooms_and_can_add_rooms
    assert_equal [], @house.rooms
    @house.add_room(@room1)
    @house.add_room(@room2)
    assert_equal [@room1, @room2], @house.rooms
  end
end
