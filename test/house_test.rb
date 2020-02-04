require_relative 'test_helper.rb'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists_with_attributes

    assert_instance_of House, @house
    assert_equal 400000, @house.price
    assert_equal [], @house.rooms
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_it_knows_it_its_above_market_range

    assert_equal false, @house.above_market_range?

    house_2 = House.new("$500000", "145 dog ave")

    assert_equal false, house_2.above_market_range?

    house_3 = House.new("$500001", "234 cat st")

    assert house_3.above_market_range?
  end

  def test_it_can_organize_rooms_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_3], @house.rooms_from_category(:living_room)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_it_can_calculate_area_of_the_house
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end

  def test_it_lists_house_details_as_hash

    assert_equal Hash, @house.details.class
    assert_equal ({"price" => 400000, "address" => "123 sugar lane"}), @house.details
  end

  def test_it_can_calculate_price_per_square_foot
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_it_can_sort_rooms_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2, @room_3, @room_4], @house.rooms_sorted_by_area
  end

end
