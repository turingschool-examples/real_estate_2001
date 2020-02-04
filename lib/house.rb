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
    if @price.delete('$').to_i > 500000
      true
    else
      false
    end
  end

  def price_per_square_foot
    house_total_square_feet = 0
    @rooms.each do |room|
      house_total_square_feet += room.area
    end
    ((@price.delete('$').to_i / house_total_square_feet.to_f)).round(2)
  end
end
