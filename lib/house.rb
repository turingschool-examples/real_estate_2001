class House

  attr_reader :price, :address, :rooms, :details

  def initialize(price, address)
    @price = price.gsub("$", "").to_i
    @address = address
    @rooms = []
    @details = {
      "price" => @price,
      "address" => @address
    }
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000 ? true : false
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def price_per_square_foot
    (@price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area}.reverse
  end

  def rooms_by_category
    all_room_categories = []
    @rooms.each {|room| all_room_categories << room.category}
    unique_room_categories = all_room_categories.uniq

    rooms_by_category = {}
    unique_room_categories.each do |room_cat|
      rooms_by_category[room_cat] = rooms_from_category(room_cat)
    end
    rooms_by_category
  end
end
