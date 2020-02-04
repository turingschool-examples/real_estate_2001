require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def setup
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:living_room, 15, '12')
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_it_exists
    assert_instance_of House, @house
  end
end
