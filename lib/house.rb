class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    # I'm going to defend this now... why would we ever need to store price data for a house as anything other than an integer?
    # I've never seen a house listed as $400,000.99
    # I don't think it's necessary to preserve anything other than fixnums in this attribute.
    @price = price.gsub(/[^0-9]/, "").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_range?
    @price > 500000 ? true : false
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    @rooms.sum {|room| room.area}
  end
end
