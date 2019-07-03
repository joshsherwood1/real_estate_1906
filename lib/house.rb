class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @area_total = 0
  end

  def price
    @price.tr('$', '').to_i
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.select{|room| room.category == category}
  end

  def area
    @rooms.each do |room|
      @area_total += room.area
    end

    @area_total

  end
end
