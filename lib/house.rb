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

  def price_per_square_foot
    (price.to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    own_area = {}
    rooms.each do |room|
      own_area[room] = room.area
    end
    own_area.keys.sort_by { |value| own_area[value] }.reverse
  end
end