class House

  def initialize(price, address)
    @price = price
    @address = address
  end

  def price
    @price[1..-1].to_i
  end

end
