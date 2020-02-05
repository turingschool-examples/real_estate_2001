class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = reformated_price(price)
    @address = address
    @rooms = []
    @above_market_price = 500000
  end

  def add_room(room)
    @rooms << room
  end

  def reformated_price(price)
    price.delete('$').to_i
  end

  def above_market_price?
    @price > @above_market_price
  end

  def rooms_from_category(category)
    @rooms.find_all {|room| room.category == category}
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def details(price, address)
    key_values = ["price", price ], ["address", address]
    key_values.to_h
  end

  def price_per_square_foot
    (@price / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area}.reverse
  end

  def rooms_sorted_by_category
    @rooms.group_by {|room| room.category}
  end
end
