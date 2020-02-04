class House
  attr_reader :address

  def initialize(price_paramater, address_parameter)
    @price = price_paramater
    @address = address_parameter
  end

  def price
    @price.gsub("$", '').to_i
  end
end
