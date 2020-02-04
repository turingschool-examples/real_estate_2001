class Room
  attr_reader :category, :length, :width
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
  end

  def area
    @length.to_f * @width.to_f
  end

  def is_painted?
    
  end
end
