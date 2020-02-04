require_relative 'test_helper.rb'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_it_exists_with_attributes

    assert_instance_of House, @house
    assert_equal 400000, @house.price
    assert_equal [], @house.rooms
    assert_equal "123 sugar lane", @house.address
  end

end
