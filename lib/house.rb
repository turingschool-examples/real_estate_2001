class House
  attr_reader :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @market_average = 500000
  end

  def price
    (@price.delete("$")).to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    return true if price > @market_average
      false
  end

  def rooms_from_category(category)
    rooms.find_all do |room|
      category == room.category
    end
  end

end
