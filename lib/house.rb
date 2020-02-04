class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price[1..-1].to_i > 500000 ? true : false
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def details
    {"price" => @price[1..-1].to_i, "address" => @address}
  end

  def price_per_square_foot
    (@price[1..-1].to_f / area).round(2)
  end

  def rooms_sorted_by_area
    (@rooms.sort_by {|room| room.area}).reverse
  end

  def rooms_by_category
    rmc = {}
    categories = @rooms.uniq {|room| room.category}
    categories.each do |category|
      rmc[category] = rooms_from_category(category)
    end
    rmc
  end
end
