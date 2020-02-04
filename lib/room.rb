class Room

  attr_reader :category

  def initialize(category, length, width)
    @category = category
    @length = length.to_i
    @width = width.to_i
  end

  def area
    @length * @width
  end
end
