class Room
  attr_reader :category, :length, :width
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @coats_of_paint = 0
  end

  def area
    @length.to_f * @width.to_f
  end

  def painted?
    if @coats_of_paint == 0
      false
    else
      true
    end
  end

  def paint
    @coats_of_paint +=1
  end
end
