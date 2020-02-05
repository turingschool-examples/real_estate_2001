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

  def test_house_has_attributes
    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal ([]), @house.rooms
  end

  def test_house_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_house_is_above_or_below_market_average_price
    house_1 = House.new("$400000", "123 sugar lane")
    refute house_1.above_market_price?
    house_2 =  House.new("$600000", "123 sugar lane")
    assert house_2.above_market_price?
  end

  def test_house_can_list_rooms_from_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal ([@room_1, @room_2]), @house.rooms_from_category(:bedroom)
    assert_equal ([@room_4]), @house.rooms_from_category(:basement)
  end

  def test_house_can_calculate_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 1900, @house.area
  end

  def test_house_can_list_details
    expected = {"price" => 400000, "address" => "123 sugar lane"}
    assert_equal expected, @house.details
  end

  def test_house_can_calculate_price_per_square_foot
    @house.add_room(@room_4)
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_rooms_can_be_sorted_by_area
    @house.add_room(@room_4)
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)

    expected = [@room_4, @room_3, @room_2, @room_1]
    assert_equal expected, @house.rooms_sorted_by_area
  end

  def test_rooms_can_be_sorted_by_category

    @house.add_room(@room_4)
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)

    expected = {:bedroom=>[@room_1, @room_2], :living_room=>[@room_3], :basement=> [@room_4]}
    assert_equal expected, @house.rooms_by_category
  end
end
