class House

  attr_reader :address, :price, :rooms

  def initialize(price_parameter, address_parameter)
    @price = price_parameter.delete_prefix('$').to_i
    @address = address_parameter
    @rooms = []
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



end
