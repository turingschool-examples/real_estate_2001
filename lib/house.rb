class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.tr('^0-9', '').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500_000
  end

  def rooms_from_category(category)
    @rooms.select { |room| room.category == category }
  end

  def area
    @rooms.map { |room| room.area }.sum
  end

  def details
    details = {}
    details['price'] = @price
    details['address'] = @address
    details
  end

  def price_per_square_foot
    (@price / area.to_f).round(2)
  end

  # def rooms_sorted_by_area
  #   require 'pry'; binding.pry
  #   @rooms.each { |room| room.area }.sort { |low, high| high <=> low }
  # end

  def rooms_by_category
    rooms_hash = {}
    @rooms.each do |room|
      if !rooms_hash.key?(room.category)
        rooms_hash[room.category] = [room]
      else
        rooms_hash[room.category] << room
      end
    end
    rooms_hash
  end
end
