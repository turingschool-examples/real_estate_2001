class House
  attr_reader :price, :address

  def initialize(price, address)
    @price = price
    @address = address
  end

  def price
    if @price[0] == "$"
      @price[1..-1].to_i
    elsif (@price[0] != "$") && (@price.class == String)
      @price.to_i
    elsif @price.class == Integer
      @price
    else
    end
  end
end
