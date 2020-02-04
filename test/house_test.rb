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
    house = House.new("$400000", "123 sugar lane")

    assert_equal 400000, house.price
    assert_equal "123 sugar lane", house.address
    assert_equal [], house.rooms
  end

  def test_can_add_rooms
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house = House.new("$400000", "123 sugar lane")

    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal [room_1, room_2], house.rooms
  end

  def test_returns_above_market_average
    house1 = House.new("$400000", "123 sugar lane")
    house2 = House.new("$600000", "123 sesame street")


    assert_equal false, house1.above_market_average?
    assert_equal true, house2.above_market_average?
  end
end


# pry(main)> house.above_market_average?
# #=> false
#
# pry(main)> room_1 = Room.new(:bedroom, 10, '13')
# #=> #<Room:0x00007fccd29b5720...>
#
# pry(main)> room_2 = Room.new(:bedroom, 11, '15')
# #=> #<Room:0x00007fccd2985f48...>
#
# pry(main)> room_3 = Room.new(:living_room, 25, '15')
# #=> #<Room:0x00007fccd383c2d0...>
#
# pry(main)> room_4 = Room.new(:basement, 30, '41')
# #=> #<Room:0x00007fccd297dc30...>
#
# pry(main)> house.add_room(room_1)
#
# pry(main)> house.add_room(room_2)
#
# pry(main)> house.add_room(room_3)
#
# pry(main)> house.add_room(room_4)
#
# pry(main)> house.rooms_from_category(:bedroom)
# #=> [#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>]
#
# pry(main)> house.rooms_from_category(:basement)
# #=> [#<Room:0x00007fccd297dc30...>]
#
# pry(main)> house.area
# #=> 1900
#
# pry(main)> house.details
# #=> {"price" => 400000, "address" => "123 sugar lane"}
