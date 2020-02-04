class House

  attr_reader :address, :price, :rooms, :details

  def initialize(price_parameter, address_parameter)
    @price = price_parameter.delete_prefix('$').to_i
    @address = address_parameter
    @rooms = []
    @details = {"price" => @price, "address" => @address}
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category_parameter)
    array_of_rooms_from_category = []
    @rooms.each do |room|
      if room.category == category_parameter
        array_of_rooms_from_category << room
      end
    end
    array_of_rooms_from_category
  end

  def area
    area_sum = 0
    @rooms.each do |room|
      area_sum = area_sum + room.area
    end
    area_sum
  end

  def price_per_square_foot
    price_per_square = 0.0
    price_per_square = @price.to_f / area.to_f
    price_per_square.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      -room.area
    end
  end


end
