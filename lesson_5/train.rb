class Train
  attr_reader :number, :type, :wagons

  def initialize(number, type = :passenger)
    @number = number
    @type = type
    @wagons = []
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

  def add_wagon(wagon)
    self.wagons.push(wagon) if @speed == 0
  end

  def delete_wagon
    self.wagons.pop() if @speed == 0
  end

  def wagons_count
    return @wagons.size
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