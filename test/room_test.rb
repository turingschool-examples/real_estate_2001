require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test
  def test_it_exists
    room = Room.new(:bedroom, 10, '13')
    assert_instance_of Room, room
  end

  def test_it_has_a_category
    room = Room.new(:bedroom, 10, '13')
    assert_equal :bedroom, room.category
  end

  def test_it_can_get_area
    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:living_room, 15, '12')
    assert_equal 130, room1.area
    assert_equal 180, room2.area
  end

  def test_it_is_not_painted_by_default
    room = Room.new(:bedroom, 10, '13')

    assert_equal false, room.is_painted?
  end

  def test_it_can_be_painted
    room = Room.new(:bedroom, 10, '13')

    room.paint
    assert_equal true, room.is_painted?
  end

  def test_can_return_room_area
    room = Room.new(:bedroom, 10, '13')

    assert_equal 130, room.area    
  end
end
