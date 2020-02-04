class House
  attr_reader :price, :address, :rooms

  def initialize(value, address)
    @price = (value.sub("$", "")).to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    return @price > 500000
  end

end
