require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_it_has_price
    house = House.new("$400000", "123 sugar lane")
    assert_equal house.price, "$400000"
  end

  def test_it_has_address
    house = House.new("$400000", "123 sugar lane")
    assert_equal house.address, "123 sugar lane"
  end

  def test_it_has_rooms
    house = House.new("$400000", "123 sugar lane")
    assert_equal house.rooms, []
  end

end
