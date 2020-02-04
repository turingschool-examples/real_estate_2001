class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    # I'm going to defend this now... why would we ever need to store price data for a house as anything other than an integer?
    # I don't think it's necessary to preserve anything other than numbers in this attribute.
    @price = price.gsub(/[^0-9]/, "").to_i
    @address = address
    @rooms = []
  end
end
