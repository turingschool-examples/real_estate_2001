require_relative 'test_helper.rb'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
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

end
