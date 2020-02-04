require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < MiniTest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
  end

  def test_houses_exist
    assert_instance_of House, @house
  end

  def test_houses_have_prices
    assert_equal 400000, @house.price
  end

  def test_houses_have_addresses
    assert_equal "123 sugar lane", @house.address
  end

  def test_houses_have_rooms
    assert_equal [], @house.rooms
  end

  def test_rooms_can_be_added_to_houses
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end
end

# pry(main)> house.rooms
# #=> [#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>]
# ```
