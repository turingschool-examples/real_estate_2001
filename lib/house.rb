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

  def above_market?
    if @price.to_i > 500000
      true
    else
      false
    end
  end

end
