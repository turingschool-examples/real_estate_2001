require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_attributes_can_be_returned_via_methods
    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

  def test_house_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_above_market_average?
    assert_equal false, @house.above_market_average?
    house_2 = House.new("$500001", "123 sugar lane")
    house_3 = House.new("$500000", "123 sugar lane")

    assert_equal true, house_2.above_market_average?
    assert_equal false, house_3.above_market_average?
  end

  def test_house_can_find_rooms_from_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_house_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 1900, @house.area
  end

  def test_house_details
    expected = {"price" => 400000, "address" => "123 sugar lane"}
    assert_equal expected, @house.details
    house_2 = House.new("$500001", "122 sugar lane")
    expected2 = {"price" => 500001, "address" => "122 sugar lane"}
    assert_equal expected2, house_2.details

  end
  #
  # pry(main)> house.details
  # #=> {"price" => 400000, "address" => "123 sugar lane"}
end
