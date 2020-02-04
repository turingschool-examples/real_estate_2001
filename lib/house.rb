class House
attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    rooms << room
  end

  def above_market_average?
    if @price[1..-1].to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms_category = []
    @rooms.each do |room|
      if room.category == category
        rooms_category << room
      end
    end
    rooms_category
  end

  def area
    all_room_areas = []
    @rooms.each do |room|
      all_room_areas << room.area
    end
    all_room_areas.sum
  end

  def details
    details = {price: @price[1..-1].to_i, address: @address}
  end

  def price_per_square_foot
    (@price[1..-1].to_i / area.to_f).round(2)
  end

  def rooms_sorted_by_area
      @rooms.sort_by { |room| -room.area }
  end

  def rooms_by_category
      @rooms.sort_by { |room| room.category }
  end


end



# pry(main)> house.rooms_by_category
# #=> {:bedroom=>[#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>], :living_room=> [#<Room:0x00007fccd383c2d0...>], :basement=> [#<Room:0x00007fccd297dc30...>]}
