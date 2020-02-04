class House
attr_reader :price, :address, :rooms
  def initialize(price, address, rooms)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

end


# didnt get very far was working at a pretty slow pace
