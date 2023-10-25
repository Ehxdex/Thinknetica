class Station
  attr_reader :trains, :station_name
  def initialize(station_name)
    @station_name = station_name
  	@trains = []
  end

  def arrival_of_train(train)
    @trains << train
  end

  def departure_of_train(train)
    @trains.delete(train)
  end

  def show_trains_on_station_by_type(type)
    count = 0
    @trains.each do |train|
      if train.train_type == type
        count += 1     
      end
    end
    return "На станции #{type}: #{count}"
  end
end

class Route
  attr_reader :departure_station, :intermediate_stations, :terminal_station, :all_stations
  def initialize(departure_station, terminal_station)
    @departure_station = departure_station
    @terminal_station = terminal_station
    @intermediate_stations = []
    @all_stations = []
  end

  def add_route_station(station)
    @intermediate_stations << station
  end

  def show_route_stations
    @all_stations << @departure_station.station_name
    @intermediate_stations.each {|station| @all_stations << station.station_name}
    @all_stations << @terminal_station.station_name
    return @all_stations
  end
end

class Train
  attr_accessor :number_of_carriages
  attr_reader :train_type, :train_number, :current_station

  def initialize(train_number, train_type, number_of_carriages)
    @train_number = train_number
    @train_type = train_type
    @number_of_carriages = number_of_carriages
    @current_station = ""
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

  def increase_number_of_carrieges
    @number_of_carriages += 1 if @speed == 0
  end

  def decrease_number_of_carrieges
    @number_of_carriages -= 1 if @speed == 0
  end

  def current_route(route)
    @current_station = route.departure_station.station_name
    return "Маршрут получен, вы на станции #{route.departure_station.station_name}"
  end

  def next_station(route)
    next_index = route.all_stations[0..-1].find_index(@current_station) + 1
    @current_station = route.all_stations[next_index]
    return @current_station
  end

  def previous_station(route)
    previous_index = route.all_stations[0..-1].find_index(@current_station) - 1
    @current_station = route.all_stations[previous_index]
    return @current_station
  end
end