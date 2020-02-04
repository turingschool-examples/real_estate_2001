require './lib/room'

class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.gsub(/\D/,'').to_i
    @address = address
    @rooms = []
  end

  def add_room(room_parameter)
    @rooms << room_parameter
  end

  def above_market_average?
    @market_average = 500000
      if @price > @market_average
        true
      else
        false
      end
    end

  def rooms_from_category(room_category_parameter)
    @rooms_in_category = []
    rooms .each do |room|
      if room.category == room_category_parameter
        @rooms_in_category << room
      end
    end
    @rooms_in_category 
  end

end
