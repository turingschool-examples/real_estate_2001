class House
  attr_reader :address, :rooms
  def initialize(price , address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    @price.delete('$').to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    self.price > 5000000
  end

end
