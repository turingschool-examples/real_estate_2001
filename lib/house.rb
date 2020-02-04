class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []

  end

  def price
    if @price[0] == "$"
      @price[1..-1].to_i
    elsif (@price[0] != "$") && (@price.class == String)
      @price.to_i
    elsif @price.class == Integer
      @price
    else
    end
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    return true if price > 500000
    false
  end

  def rooms_from_category(category)
    @rooms.find_all { |room| room.category == category }
  end

  def area
    (@rooms.map { |room| room.area }).sum
  end

  def details
    details = Hash.new
    details['price'] = price
    details['address'] = address
    details
  end
end
