
require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
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

  def test_it_initializes_with_empty_rooms_array
    assert_equal [], @house.rooms
  end

  def test_it_can_add_rooms_and_store_in_rooms
    @room_1 = Room.new(:bedroom, 10, '13')
    assert_equal [@room_1], @house.add_room(@room_1)
    @room_2 = Room.new(:bedroom, 11, '15')
    assert_equal [@room_1, @room_2], @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_it_is_above_market_average
    assert_equal false, @house.above_market_average?
  end

  #house.above_market_average?
  #=> false

  #room_1 = Room.new(:bedroom, 10, '13')
  #=> #<Room:0x00007fccd29b5720...>

  #room_2 = Room.new(:bedroom, 11, '15')
  #=> #<Room:0x00007fccd2985f48...>

  #room_3 = Room.new(:living_room, 25, '15')
  #=> #<Room:0x00007fccd383c2d0...>

  #room_4 = Room.new(:basement, 30, '41')
  #=> #<Room:0x00007fccd297dc30...>

  #house.add_room(room_1)

  #house.add_room(room_2)

  #house.add_room(room_3)

  #house.add_room(room_4)

  #house.rooms_from_category(:bedroom)
  #=> [#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>]

  #house.rooms_from_category(:basement)
  #=> [#<Room:0x00007fccd297dc30...>]

  #house.area
  #=> 1900

  #house.details
  #=> {"price" => 400000, "address" => "123 sugar lane"}


end
