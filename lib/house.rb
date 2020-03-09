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

  def above_market_average?
    @price > 500000
  end

end
