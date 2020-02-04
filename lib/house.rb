class House

  attr_reader :price

  def initialize(price, address)
    @price = price.gsub("$", "").to_i
    @address = address
  end
end
