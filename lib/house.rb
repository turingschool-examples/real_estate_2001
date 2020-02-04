class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []

  end

  def price
    if @price[0] == "$"
      @price[1..-1].to_i
    elsif (@price[0] != "$") && (@price.class == String)
      @price.to_i
    elsif @price.class == Integer
      @price
    else
    end
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    return true if price > 500000
    false
  end

  def rooms_from_category(category)
    @rooms.find_all { |room| room.category == category }
  end

  def area
    (@rooms.map { |room| room.area }).sum
  end

  def details
    details = Hash.new
    details['price'] = price
    details['address'] = address
    details
  end

  def price_per_square_foot
    (price.to_f / area.round).round(2)
  end

  def rooms_sorted_by_area
    sorted_array = @rooms.sort_by { |room| room.area }
    sorted_array.reverse
  end

  def rooms_by_category
    rooms_collection = Hash.new
    @rooms.map do |room|
      if rooms_collection.key?(room.category) == true
        rooms_collection[room.category] << room
      else
        rooms_collection[room.category] = [room]
      end
    end
    rooms_collection
  end
end
