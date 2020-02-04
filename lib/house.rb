class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    @price[1..-1].to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if price >= 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms.find_all {|room| room.category == category}
  end

  def area
    area_by_room = rooms.map do |room|
      room.area
    end
    area_by_room.sum
  end
end

# room.area
