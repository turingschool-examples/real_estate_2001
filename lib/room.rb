class Room
  attr_reader :category, :length, :width

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width.to_i
  end

  def area
    @length * @width.to_i
  end


  def paint
    @length 
  end


  def is_painted?
     if paint == 0

    end
  end
end
