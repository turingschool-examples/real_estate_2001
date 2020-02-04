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
end
