class House
attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    rooms << room
  end

  def above_market_average?
    if @price[1..-1].to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms_by_category = []
    @rooms.each do |room|
      if room.category == category
        rooms_by_category << room
      end
    end
    rooms_by_category
  end

  def area
    all_room_areas = []
    @rooms.each do |room|
      all_room_areas << room.area
    end
    all_room_areas.sum
  end

  def details
    details = {price: @price[1..-1].to_i, address: @address}
  end

end
