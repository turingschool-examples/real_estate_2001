class House
  attr_reader :price

  def initialize(price, a)
    @price = price.gsub("$", "").to_i
    @a = a
  end
end
