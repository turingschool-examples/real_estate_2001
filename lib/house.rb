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

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    total_area = 0
    rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
    {"price"=>@price, "address"=>@address}
  end


end
