class Room
  attr_reader :category

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width.to_i
    @paint_coats = 0
  end

  def area
    @length * @width
  end

  def is_painted?
    @paint_coats == 0 ? false : true
  end

  def paint
    @paint_coats += 1
  end
end
