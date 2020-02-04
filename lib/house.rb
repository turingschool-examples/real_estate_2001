class House
  attr_reader :price, :address, :rooms
    def initialize(price, address)
      @price = price
      @address = address
      @rooms = []
    end

    def add_room(new_room)
      @rooms << new_room
    end

    def above_market_average?
      if @price.to_i > 500000
        true
      else
        @price.to_i < 500000
        false
      end
    end

    def rooms_from_category(category)
      rooms_from_category = []
      @rooms.select do |room|
        if room.category == category
          rooms_from_category << room
        end
    end
  end
end
