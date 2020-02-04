require "./lib/room"
require "./lib/house"
require 'minitest/autorun'
require 'minitest/pride'

class HouseTest < Minitest::Test

  def test_if_house_exist
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_if_house_has_price
    house = House.new("$400000", "123 sugar lane")
    assert_equal 400000, house.price
  end

  def test_if_house_has_address
    house = House.new("$400000", "123 sugar lane")
    assert_equal "123 sugar lane", house.address
  end

  def test_if_house_has_rooms
    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)
    assert_equal [room_1,room_2], house.rooms
  end

  def test_if_house_is_above_market_average?
    house = House.new("$400000", "123 sugar lane")
    assert_equal false, house.above_market_average?
  end
end
