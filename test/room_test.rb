require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test
  def setup
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:living_room, 15, '12')
  end

  def test_it_exists
    assert_instance_of Room, @room_1
  end

  def test_it_has_a_category
    assert_equal :bedroom, @room_1.category
  end

  def test_it_can_get_area
    assert_equal 130, @room_1.area
    assert_equal 180, @room_2.area
  end

  def test_is_painted_and_paint
    assert_equal false, @room_1.is_painted?
    @room_1.paint
    assert @room_1.is_painted?
  end
end
