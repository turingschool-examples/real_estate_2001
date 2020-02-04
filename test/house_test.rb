require_relative 'test_helper.rb'

class HouseTest < Minitest::Test

  def setup
    @house = House.new
  end

  def test_it_exists
    assert_instance_of House, @house
  end

end
