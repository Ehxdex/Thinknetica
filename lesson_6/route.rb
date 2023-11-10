require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :first_station, :mid_stations, :last_station
  
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    validate!
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

  protected

  def validate!
    raise ArgumentError, "Name first or last stations can't be nil" if @first_station.nil? or @last_station.nil?
    raise ArgumentError, "Name first or last stations must be different" if @first_station.name == @last_station.name
  end
end