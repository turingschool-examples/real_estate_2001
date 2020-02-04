require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test
  def setup
    @room = Room.new(:bedroom, 10, '13')
    @room2 = Room.new(:living_room, 15, '12')
  end

  def test_it_exists

    assert_instance_of Room, @room
  end

  def test_it_has_a_category

    assert_equal :bedroom, @room.category
  end

  def test_it_can_get_area

    assert_equal 130, @room.area
    assert_equal 180, @room2.area
  end

  def test_it_is_not_painted_by_default

    assert_equal false, @room.is_painted?
  end

  def test_it_can_be_painted
    @room.paint

    assert @room.is_painted?
  end
end
