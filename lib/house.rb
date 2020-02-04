class House
  attr_reader :price, :address, :rooms, :details

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
    @total_area = 0
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
    rooms_in_category = []
    @rooms.each do |room|
      if room.category == category
        rooms_in_category << room
      end
    end
    rooms_in_category
  end

  def area
    @rooms.each do |room|
      @total_area += room.area
    end
    @total_area
  end

  def price_per_square_foot
    area
    (@price / @total_area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by(&:area).reverse!
  end

  def rooms_by_category
    @rooms.sort_by {|room| [:category, room.category]}
  end
end
