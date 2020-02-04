require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_rooms_starts_as_empty_array
    house = House.new("$400000", "123 sugar lane")
    house.rooms
    
    assert_equal [], house.rooms
  end




end
