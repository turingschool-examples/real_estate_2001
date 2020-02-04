class House
  attr_reader :address, :rooms

  def initialize(price_paramater, address_parameter)
    @price = price_paramater
    @address = address_parameter
    @rooms = []
  end

  def price
    @price.gsub("$", '').to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > 500000 ? true : false
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    total_area = 0
    @rooms.each {|room| total_area += room.area}
    total_area
  end

  def details
    details = {"price" => price, "address" => @address}
    details
  end

  def price_per_square_foot
    total_per_square_foot = 0
    if area != 0
      total_per_square_foot = (price / area.to_f).round(2)
    end
    total_per_square_foot
  end

  def rooms_sorted_by_area
    rooms_sorted = []
    rooms.each do |room|
      if rooms_sorted.first == nil
        rooms_sorted.append room
      elsif room.area > rooms_sorted.first.area
        rooms_sorted.prepend room
      else
        rooms_sorted.append room
      end
    end
    rooms_sorted
  end

  def rooms_by_category
    # iterate through rooms and if they are in the same category put in the same array
    # if in a different category put in a seperate array
    # ex:
    # {:bedroom=>[#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>]}
  end
end
