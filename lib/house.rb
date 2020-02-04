class House
  attr_reader :price, :address

  def initialize(price, address)
    @price = price.gsub(/[^0-9]/, "").to_i
    @address = address
  end
end
