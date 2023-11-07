require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :first_station, :mid_stations, :last_station
  
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @mid_stations = []
    register_instance
  end

  def add_station(station)
    @mid_stations << station
  end

  def delete_station(station)
    @mid_stations.delete(station)
  end

  def stations
    return [@first_station, @mid_stations, @last_station].flatten
  end
end