class Room
attr_reader :category
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint = false
  end

  def area
    @length * @width.to_i
  end

  def is_it_painted?
    @paint
  end

  def paint_item
    @paint = true
  end
end
