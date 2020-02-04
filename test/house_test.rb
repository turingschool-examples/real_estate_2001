require 'minitest/autorun'
require 'minitest/pride'
require "./lib/room"
require "./lib/house"

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

  def test_it_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house.add_room(room_1)
    house.add_room(room_2)
    house.rooms

    assert_equal [room_1, room_2], house.rooms
  end

  def test_it_returns_above_market_average_false
      house = House.new("$400000", "123 sugar lane")
      house.above_market_average?

      assert_equal false, house.above_market_average?

  end

  def test_it_can_list_rooms_by_category
   house = House.new("$400000", "123 sugar lane")

   room_1 = Room.new(:bedroom, 10, '13')
   room_2 = Room.new(:bedroom, 11, '15')
   room_3 = Room.new(:living_room, 25, '15')
   room_4 = Room.new(:basement, 30, '41')

   house.add_room(room_1)
   house.add_room(room_2)
   house.add_room(room_3)
   house.add_room(room_4)

   assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
   assert_equal [room_4], house.rooms_from_category(:basement)
  end

  def test_it_can_return_house_area
    skip
     house = House.new("$400000", "123 sugar lane")

     room_1 = Room.new(:bedroom, 10, '13')
     room_2 = Room.new(:bedroom, 11, '15')
     room_3 = Room.new(:living_room, 25, '15')
     room_4 = Room.new(:basement, 30, '41')

     house.add_room(room_1)
     house.add_room(room_2)
     house.add_room(room_3)
     house.add_room(room_4)

     assert_equal 1900, house.area
   end


    def test_house_has_details
      house = House.new("$400000", "123 sugar lane")

      assert_equal ({"price" => 400000, "address" => "123 sugar lane"}), house.details
    end
end
