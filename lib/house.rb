class House
  attr_reader :price, :address, :rooms, :details

  def initialize(price, address)
    # I don't think it's necessary to preserve anything other than fixnums in this attribute.
    # Regexp superior to just deleting the $ to account for any other invalid character
    @price = price.gsub(/[^0-9]/, "").to_i
    @address = address
    @rooms = []
    @details = {"price"=>@price, "address"=>@address}
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_range?
    @price > 500000 
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def price_per_square_foot
    (@price / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area}.reverse
  end

  def rooms_by_category
    keys = @rooms.map(&:category).uniq
    values = keys.map do |key|
      @rooms.select {|room| room.category == key}
    end
    keys.zip(values).to_h
  end
end
