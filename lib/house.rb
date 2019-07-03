class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @area_total = 0
    @hash_array = []
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

  def price_per_square_foot
    (price / area.to_f).round(2)
  end

  # def rooms_sorted_by_area
  #   @rooms.each do |room|
  #     @hash_array << room.area
  #   end
  #   @hash_array
  # end
end
