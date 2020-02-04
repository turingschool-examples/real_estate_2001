class House

  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(room_category)
    @rooms.find_all {|room| room.category == room_category}
  end

  def area
    area = 0
    @rooms.each {|room| area = area + room.area}
    area
  end

  def house_details
    details = {
      "price" => price,
      "address" => address
    }
    details
  end
end
