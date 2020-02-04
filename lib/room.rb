class Room

  attr_reader :category

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint = nil
  end

  def area
    @length * @width.to_i
  end

  def is_painted?
    if @paint == nil
      false
    else
      true
    end
  end

  def paint
    @paint = true
  end
end
