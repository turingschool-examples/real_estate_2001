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

  def price_per_square_foot
    (@price / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    (rooms.sort_by {|room| room.area}).reverse
  end

  def rooms_by_category
    list_of_categories = []
    rooms.each do |room|
      list_of_categories << room.category
    end
    list_of_categories.uniq!
    list_of_rooms_by_category = {}
    list_of_categories.each do |category|
      list_of_rooms_by_category[category] = rooms_from_category(category)
    end
    list_of_rooms_by_category
  end


end
