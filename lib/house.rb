class House
  attr_reader :price, :address, :rooms, :details

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
    @details = {"price" => @price,
                "address" => @address
               }
  end

  def add_room(room_object)
    @rooms << room_object
  end

  def above_market_average?
    if @price > 500000 then true else false end
  end

  def rooms_from_category(category)
    sorted_by_category = []
    @rooms.each do |room|
      if room.category == category
        sorted_by_category << room
      end
    end
    sorted_by_category
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end
end
