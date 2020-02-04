class Room

  attr_reader :category
  attr_accessor :is_painted
  alias_method :is_painted?, :is_painted

  def initialize(category, length, width)
    @category = category
    @length = length.to_i
    @width = width.to_i
    @is_painted = false
  end

  def area
    @length * @width
  end

  def paint
    @is_painted = true
  end
  
end
