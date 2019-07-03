require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class RoomTest < Minitest::Test
  def setup
    @room = Room.new(:bedroom, 10, 13)
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)
    @rooms = [@room_1, @room_2]
    @rooms_1_through_4 = [@room_1, @room_2, @room_3, @room_4]
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_that_house_exists

    assert_instance_of House, @house
  end

  def test_that_house_has_attributes

    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
  end

  def test_that_house_has_empty_array_of_rooms

    assert_equal [], @house.rooms
  end

  def test_that_rooms_exist

    assert_instance_of Room, @room_1
    assert_instance_of Room, @room_2
  end

  def test_to_verify_that_we_have_added_rooms

    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal @rooms, @house.rooms
  end

  def test_to_see_how_many_rooms_are_bedrooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal @rooms_1_through_4.first(2), @house.rooms_from_category(:bedroom)
    assert_equal @rooms_1_through_4.last(1), @house.rooms_from_category(:basement)
  end

  def test_to_see_total_area_of_added_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 1900, @house.area
  end

  def test_to_see_total_price_per_square_feet
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  # def test_show_rooms_sorted_by_area
  #   assert_equal @rooms_1_through_4.reverse, @house.rooms_sorted_by_area
  # end

end
