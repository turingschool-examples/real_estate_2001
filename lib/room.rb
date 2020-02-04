class Room
  attr_reader :category, :area

  def initialize(category, length, width)
    @category = category
    @length = length.to_i
    @width = width.to_i
    @area = nil
    @painted = false
  end

  def area
    @length * @width
  end

  def paint
    @painted = true
  end

  def is_painted?
    @painted
  end
end
