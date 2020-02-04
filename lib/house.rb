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
end
