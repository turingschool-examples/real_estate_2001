class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price > 500000
      true
    else
      false
    end
  end

  def area
    room_areas = []
    @rooms.each do |room|
      room_areas << room.area
    end
    room_areas.sum
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      if room.category == category
        room
      end
    end
  end

  def details
    details = {"price" => @price, "address" => @address}
  end
end
