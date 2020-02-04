require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < MiniTest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_houses_exist
    assert_instance_of House, @house
  end

  def test_houses_have_prices
    assert_equal 400000, @house.price
  end

end

# pry(main)> house.price
# #=> 400000
#
# pry(main)> house.address
# #=> "123 sugar lane"
#
# pry(main)> house.rooms
# #=> []
#
# pry(main)> room_1 = Room.new(:bedroom, 10, '13')
# #=> #<Room:0x00007fccd29b5720...>
#
# pry(main)> room_2 = Room.new(:bedroom, 11, '15')
# #=> #<Room:0x00007fccd2985f48...>
#
# pry(main)> house.add_room(room_1)
#
# pry(main)> house.add_room(room_2)
#
# pry(main)> house.rooms
# #=> [#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>]
# ```
