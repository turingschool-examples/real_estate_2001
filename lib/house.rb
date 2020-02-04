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
end
