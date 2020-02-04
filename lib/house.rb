class House
  attr_reader :cost, :address

  def initialize(cost, address)
    @cost = cost
    @address = address
  end

  def get_cost
    @cost.gsub("$", '').to_i
  end
end
