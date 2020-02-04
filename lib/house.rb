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
    house_price = @price.chars.map { |char| char.to_i }
    house_price.join.to_i > 500000
  end

  def rooms_from_category(category)
    rooms_from_category = @rooms.find_all { |room| room.category == category }
  end

  def area
    @rooms.map { |room| room.area }.sum
  end

  def details
    house_price = @price.chars.map { |char| char.to_i }
    {
    "price" => house_price.join.to_i,
    "address" => @address
    }
  end

end
