class House

  attr_reader :address, :price

  def initialize(price_parameter, address_parameter)
    @price = price_parameter.delete_prefix('$').to_i
    @address = address_parameter
  end

end
