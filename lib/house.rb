class House

  attr_reader :address, :price, :rooms

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    rooms << room
  end

  def above_market_average?
    price > 500000
  end

  def rooms_from_category(category)
    rooms.find_all { |room| room.category == category }
  end

  def area
    total_area = []
    rooms.each { |room| total_area << room.area }
    total_area.sum
  end

  def details
    Hash.new
    {"price" => price, "address" => address}
  end
end