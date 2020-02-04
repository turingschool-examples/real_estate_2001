class Room
attr_reader  :category, :width, :length, :paint_count

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint_count = 0
  end

  def area
    @length * @width.to_i
  end

  def is_painted?
    if paint_count == 0
       false
    else
       true
    end
  end

  def paint
    @paint_count += 1
  end

end
