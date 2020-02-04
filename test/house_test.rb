require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < MiniTest::Test
  def setup
    @house = House.new('$400000', '123 sugar lane')
    @room1 = Room.new(:bedroom, 10, '13')
    @room2 = Room.new(:bedroom, 11, '15')
    @room3 = Room.new(:living_room, 25, '15')
    @room4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists_with_attributes
    assert_instance_of House, @house
    assert_equal 400_000, @house.price
    assert_equal '123 sugar lane', @house.address
  end

  def test_it_starts_no_rooms_and_can_add_rooms
    assert_equal [], @house.rooms
    @house.add_room(@room1)
    @house.add_room(@room2)
    assert_equal [@room1, @room2], @house.rooms
  end

  def test_it_can_determine_market_average
    refute @house.above_market_average?
  end

  def test_it_can_get_rooms_from_category
    @house.add_room(@room1)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)

    assert_equal [@room1, @room2], @house.rooms_from_category(:bedroom)
    assert_equal [@room4], @house.rooms_from_category(:basement)
  end

  def test_it_can_get_total_area_of_all_rooms
    @house.add_room(@room1)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)

    assert_equal 1900, @house.area
  end

  def test_it_has_details
    details_hash = { 'price' => 400_000, 'address' => '123 sugar lane' }
    assert_equal details_hash, @house.details
  end

  def test_it_can_calculate_price_per_square_foot
    @house.add_room(@room1)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  # def test_it_can_get_rooms_sorted_by_area
  #   @house.add_room(@room1)
  #   @house.add_room(@room2)
  #   @house.add_room(@room3)
  #   @house.add_room(@room4)
  #   rooms_array = [@room4, @room3, @room2, @room1,]

  #   assert @house.rooms_sorted_by_area
  #   require 'pry'; binding.pry
  #   assert_equal rooms_array, @house.rooms_sorted_by_area
  # end

  def test_it_can_get_rooms_by_category_hash
    @house.add_room(@room1)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)
    rooms_hash = {
      bedroom: [@room1, @room2],
      living_room: [@room3],
      basement: [@room4]
    }

    assert_equal rooms_hash, @house.rooms_by_category
  end
end
