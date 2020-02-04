class House
  attr_reader :price, :address, :rooms, :house_area
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @house_area = 0
  end

  def details
    {"price" => @price.tr('$', '').to_i, "address" => @address}
  end

  def add_room(room)
    @rooms << room
  end

  def area
    @rooms.each do |room|
      @house_area += room.area
    end
    @house_area
  end

  def above_market_average?
    @price.tr('$', '').to_i >= 500000
  end

  def rooms_from_category(category)
    @rooms.find_all{ |room| room.category == category}
  end
end
