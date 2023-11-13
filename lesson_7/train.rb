require_relative 'company'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  include CompanyName
  include InstanceCounter
  include Validation
  
  attr_reader :number, :type, :wagons

  @@all_train = []

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @wagons = []
    @speed = 0
    @@all_train << self
    register_instance
  end

  def self.find(number)
    @@all_train.each { |train| return train if train.number == number ? train : nil }
  end

  def acceleration(speed)
    @speed += speed
  end

  def current_speed
    return @speed
  end

  def braking
    @speed = 0
  end

  def add_wagon(wagon)
    self.wagons.push(wagon) if @speed == 0
  end

  def delete_wagon
    self.wagons.pop() if @speed == 0
  end

  def wagons_count
    return @wagons.size
  end

  def wagons_info
    @wagons.each {|wagon| yield(wagon)}
  end 

  def assign_route(route)
    @route = route
    @current_station_index = 0

    current_station.arrival_train(self)
    return "Маршрут получен, вы на станции #{current_station.name}"
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    return unless @route
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    return unless @route
    @route.stations[@current_station_index + 1]
  end

  def move_next_station
    return unless next_station
    current_station.departure_train(self)
    @current_station_index += 1
    current_station.arrival_train(self)
  end

  def move_previous_station
    return unless previous_station
    current_station.departure_train(self)
    @current_station_index -= 1
    current_station.arrival_train(self)
  end

  protected

  def validate!
    errors = []
    errors << "The train type can't be nil" if @type.nil?
    errors << "The train type can't be empty" if @type.empty?
    errors << "The train type can be only 'passenger' or 'cargo'" unless @type == :passenger or @type == :cargo
    errors << "Invalid format number of the train, must be '111-SS'" if @number !~ /^\d{3}[\W.-][a-z]{2}$/i
    raise ArgumentError, errors.join(', ') unless errors.empty?
  end
end