require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class RoomTest < Minitest::Test
  def setup
    @room = Room.new(:bedroom, 10, 13)
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @rooms = [@room_1, @room_2]
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

end
