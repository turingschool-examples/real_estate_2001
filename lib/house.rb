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
    house_price = @price.chars.each do |char|
      char.to_i
    end
    house_price.join.to_i > 500000
  end

  def rooms_from_category(category)
    require 'pry'; binding.pry
    rooms_from_category = @rooms.find_all { |room| room.category == category }
  end

end
