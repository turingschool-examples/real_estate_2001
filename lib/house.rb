class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.gsub("$", "").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000 ? true : false
  end

  def rooms_from_category(category)
    category_rooms = @rooms.select do |room|
      room.category == category
    end
  end
end
