class Room

  attr_reader :category

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
  end

  def area
    @length * @width.to_i
  end

  def is_painted?

  end
end


#
# pry(main)> room.is_painted?
# #=> false
#
# pry(main)> room.paint
#
# pry(main)> room.is_painted?
# #=> true
