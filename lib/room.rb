class Room
  attr_reader :category, :length, :width

  def initialize(category, length, width)
    @category = category
    @length = length.to_i
    @width = width.to_i
    @status = false
  end

  def area
    @length * @width
  end

  def is_painted?
    @status
  end

  def paint
    @status = true
  end
end
