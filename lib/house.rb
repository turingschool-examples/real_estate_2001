class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.tr('^0-9', '').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500_000
  end

  def rooms_from_category(category)
    @rooms.select { |room| room.category == category }
  end

  def area
    @rooms.map { |room| room.length * room.width }.sum
  end

  def details
    details = {}
    details['price'] = @price
    details['address'] = @address
    details
  end
end
