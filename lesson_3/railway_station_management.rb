class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
  	@trains = []
  end

  def arrival_train(train)
    @trains << train
  end

  def departure_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    count = 0
    @trains.each do |train|
      if train.type == type
        count += 1     
      end
    end
    return "На станции #{type}: #{count}"
  end
end

class Route
  attr_reader :first_station, :mid_stations, :last_station
  
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @mid_stations = []
  end

  def add_station(station)
    @mid_stations << station
  end

  def stations
    return [@first_station, @mid_stations, @last_station].flatten
  end
end

class Train
  attr_reader :number, :type, :wagons

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
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

  def increase_wagons
    @wagons += 1 if @speed == 0
  end

  def decrease_wagons
    @wagons -= 1 if @speed == 0
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
end