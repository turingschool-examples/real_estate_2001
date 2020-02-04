class House
  attr_reader :price, :address

  def initialize(price, address)
    @price = price.gsub(/\D/,'').to_i
    @address = address
  end

end
