class House
  attr_reader
  def initialize(price , address)
    @price = price
    @address = address
  end

  def price
    @price.delete('$').to_i
  end

end
