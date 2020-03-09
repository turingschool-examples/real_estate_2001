require 'minitest'
require './lib/room'


class House
  attr_reader :price, :address, :rooms

  def initialize(price, address, rooms)
    @price = price.delete('$').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room 
  end

end
