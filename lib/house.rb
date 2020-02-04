class House
  attr_reader :price, :address

  def initialize(price, address)
    @price = price.gsub("$", "").to_i
    @address = address
    @rooms = []
    @house_details = {}
  end

  def rooms
    @rooms
  end

  def add_room(room_name)
    @rooms << room_name
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(room_category)
    @rooms.find_all do |room|
      room.category == room_category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def details
    @house_details["price"] = @price
    @house_details["address"] = @address
    @house_details
  end

  def price_per_square_foot
    # require "pry"; binding.pry
     (@price.to_f / area).round(2)
  end

end
