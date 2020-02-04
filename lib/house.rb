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

  def area
    room_areas = rooms.map { |room| room.area }
    room_areas.sum
  end

  def details
    details = Hash.new
    details["price"] = price
    details["address"] = address
    details
  end

  def price_per_square_foot
    (price.to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    room_areas = (rooms.map { |room| room.area }).sort.reverse
    require "Pry"; binding.pry
  end

end
