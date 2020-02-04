class Room
  attr_reader :category, :paint_status

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint_status = "unpainted"
  end

  def area
    @length * @width.to_i
  end

  def is_painted?
    if @paint_status == "painted"
      true
    elsif @paint_status == "unpainted"
      false
    end
  end
end
