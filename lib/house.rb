class House
  attr_reader :price, :address

  def initialize(price, address)
    @price = price.gsub("$", "").to_i
    @address = address
    @rooms = []
  end

  def rooms
    @rooms
  end

  def add_room(room_name)
    @rooms << room_name
  end

  def above_market_average?
    @price > 500000
  end
end
