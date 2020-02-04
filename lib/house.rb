class House
  attr_reader :address, :rooms

  def initialize(price_paramater, address_parameter)
    @price = price_paramater
    @address = address_parameter
    @rooms = []
  end

  def price
    @price.gsub("$", '').to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > 500000 ? true : false
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    total_area = 0
    @rooms.each {|room| total_area += room.area}
    total_area
  end
end
