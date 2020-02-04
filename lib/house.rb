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
    if @price.delete!("$").to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms_in_category = []
    @rooms.each do |room|
      if room.category == category
        rooms_in_category << room
      end
    end
    rooms_in_category
  end
end
