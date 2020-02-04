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
end
