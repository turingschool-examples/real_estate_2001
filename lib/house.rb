class House
  attr_reader :price, :address, :rooms
  
  def initialize(value, address)
    @price = (value.sub("$", "")).to_i
    @address = address
    @rooms = []
  end

end
