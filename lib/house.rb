class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @above_market_average = false
    @sum = 0
    @area_room = []
    @detail_hsh = {}
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @above_market_average
  end

  def rooms_from_category(category)
    @rooms.map do |room|
      if room.category == category
        room
      end
    end.compact
  end

  def area
    @rooms.map do |room|
      room.length * room.width.to_i
      # require "pry"; binding.pry
    end
  end

  def details
    @detail_hsh  = {
                      "price" => "$400000",
                      "address" => "123 sugar lane"}
  end
end
