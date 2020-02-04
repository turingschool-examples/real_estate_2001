class Room
attr_reader :category
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @is_painted = false
  end

  def area
    @length * @width.to_i
  end

  def is_painted?
    if @is_painted == false
      false
    else
      true
    end
  end

  def paint
    @is_painted = true
  end
end
