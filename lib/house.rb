class House

  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > 500000
  end

  def rooms_from_category(room_category)
    @rooms.find_all {|room| room.category == room_category}
  end

  def area
    @rooms.sum {|room| room.area.to_f}
  end

  def details
    house_details = {
      "price" => price,
      "address" => address
    }
    house_details
  end

  def price_per_square_foot
    (price / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area }.reverse
  end

  def rooms_sorted_by_category
    sorted_rooms = {}
    @rooms.each do |room|
      sorted_rooms[room.category] = rooms_from_category(room.category)
    end
    sorted_rooms
  end
end
