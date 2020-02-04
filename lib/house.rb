class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @attributes = ()
    @price = price
    @address = address
    @rooms = []
    @above_market_price = "$500,000"
    @details = Hash.new
  end

  def add_room(room)
    @rooms << room
  end

  def add_commas_to_price(price)
    @price.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end

  def above_market_price?
    @price > @above_market_price
  end

  def rooms_from_category(category)
    @rooms.find_all {|room| room.category == category}
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def details(price, address)
    key_values = ["price", price ], ["address", address]
    key_values.to_h
  end

  




end
