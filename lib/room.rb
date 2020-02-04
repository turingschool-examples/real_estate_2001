class Room
  attr_reader :category

  def initialize(category_parameter, length_parameter, width_parameter)
    @category = category_parameter
    @length = length_parameter.to_i
    @width = width_parameter.to_i
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
