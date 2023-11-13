class Menu
  def initialize
    puts "Добро пожаловать в Train Station."
    @trains = []
    @stations = []
    @routes = []
  end

  def main_menu
    puts 
    puts "********** Главное меню **********"
    puts "------------ Создание ------------"
    puts "1.  Создать поезд"
    puts "2.  Создать станцию"
    puts "3.  Создать маршрут"
    puts "------------ Просмотр ------------"
    puts "4.  Список поездов"
    puts "5.  Список станций"
    puts "6.  Список маршрутов"
    puts "7.  Список поездов на станции"
    puts "--------- Редактирование ---------"
    puts "8.  Прицепить вагон(ы) к поезду"
    puts "9.  Отцепить вагон(ы) от поезда"
    puts "10. Назначить маршрут поезду"
    puts "11. Добавление станции к маршруту"
    puts "12. Удаление станции из маршрута"
    puts "----------- Управление -----------"
    puts "13. Отправить поезд на след. станцию"
    puts "14. Отправить поезд на пред. станцию"
    puts "----------------------------------"
    puts "Для 'Выхода' нажмите любую клавишу."
    puts 
  end

  def start_application
    # main_menu
  
    while  true do
      main_menu
      user_input = gets.chomp.to_i
      case user_input
      when 1 then create_train
      when 2 then create_station
      when 3 then create_route
      when 4 then show_trains
      when 5 then show_stations
      when 6 then show_routes
      when 7 then show_trains_on_station
      when 8 then add_wagon_to_train
      when 9 then remove_wagons_of_train
      when 10 then add_route_to_train
      when 11 then add_station_to_route
      when 12 then delete_station_from_route
      when 13 then train_move_next_station
      when 14 then train_move_previous_station
      when 0
        break
      else
        puts "Такого пункта меню нет, повторите ввод"
      end
    end
  end

  protected

  #1
  def create_train
    puts "Введите номер поезда"
    number = gets.chomp.to_s
    puts "Какой тип поезда вы хотите создать? 'p(passenger)' или 'c(cargo)'"
    train_type = gets.chomp.to_s
    if train_type == "p"
      train_passenger = TrainPassenger.new(number)
      train_passenger.sea
      @trains << train_passenger
      puts "Пассажирский поезд создан."
    elsif train_type == "c"
      train_cargo = TrainCargo.new(number)
      @trains << train_cargo
      puts "Грузовой поезд создан."
    else
      puts "Такого типа поезда не существует. Повторите попытку."
    end
  rescue ArgumentError => e
    puts e.message
    retry
  end

  #2
  def create_station
    puts "Напишите название станции: "
    station_name = gets.chomp.to_s.downcase
    station =  Station.new(station_name)
    @stations << station
    puts "Станция #{station_name} создана."
  rescue ArgumentError => e
    puts e.message
    retry
  end

  #3
  def create_route
    puts "Для создания маршрута укажите индекс станции отправления и станции прибытия"
    puts 
    show_stations
    puts 
    puts "Введите индекс станции отправления"
    first_station = gets.chomp.to_i
    puts "Введите индекс станции прибытия"
    last_station = gets.chomp.to_i

    route = Route.new(@stations[first_station], @stations[last_station])
    @routes << route 
    puts "Маршрут создан."
  rescue ArgumentError => e
    puts e.message
    retry
  end

  #4
  def show_trains
    return puts "Поезда еще не созданы." if @trains.empty?

    puts "Список поездов:"
    @trains.each_with_index { |train, index| puts "#{index}. Номер поезда: #{train.number}, Тип поезда: #{train.type}, Количество вагонов: #{train.wagons_count}" }
  end
    
  def search_train
    return unless show_trains

    puts "Укажите индекс поезда:"
    @t_number = gets.chomp.to_i

    puts "Укажите количество вагонов:"
    @w_count = gets.chomp.to_i
  end 

  #5
  def show_stations
    return puts "Станции еще не созданы." if @stations.empty?

    puts "Список станций:"
    @stations.each_with_index { |s, i| puts "#{i}. #{s.name}" }
  end

  #6
  def show_routes
    return puts "Маршутов нет." if @routes.empty?

    puts "Доступны следующие маршруты: "
    @routes.each_with_index {|r, i| puts "#{i}. #{r.stations}}" }
  end

  #7
  def show_trains_on_station
    show_stations
    return unless @stations[0]
    puts "Введите индекс станции, чтобы просмотреть какие на ней поезда"
    get_index = gets.chomp.to_i 
    puts "На станции #{@stations[get_index].name} поезда:" 
    station = @stations[get_index].trains
    station.each_with_index { |train, index| puts "#{index}. Номер поезда: #{train.number}, Тип поезда: #{train.type}, Количество вагонов: #{train.wagons_count}" }
  end

  #8
  def add_wagon_to_train
    return unless search_train

    train = @trains[@t_number]
    if train.type == :passenger
      @w_count.times { train.add_wagon(WagonPassenger.new) }
      puts "Пассажирские вагон(ы) добавлен(ы)"
    elsif train.type == :cargo
      @w_count.times { train.add_wagon(WagonCargo.new) }
      puts "Грузовые вагон(ы) добавлен(ы)"
    else
      puts "Вы не ввели тип выгонов"
    end  
    
  rescue ArgumentError => e
    puts e.message
    retry
  end

  #9
  def remove_wagons_of_train
    return unless search_train
    
    train = @trains[@t_number]
    @w_count.times { train.pop() }
   
    puts "Вагон(ы) отцеплены(ы)"
  end

  #10 
  def add_route_to_train
    return unless show_routes
    puts "Выберите номер маршрута к которому хотите добавить поезд"
    r_number = gets.chomp.to_i
    return unless show_trains
    puts "Укажите порядковый номер поезда который хотите добавить к маршруту"
    t_number = gets.chomp.to_i
    
    route = @routes[r_number]
    train = @trains[t_number]
    train.assign_route(route)
    puts "Маршрут получен, вы на станции #{route.first_station.name}"
  end

  #11
  def add_station_to_route
    return unless show_routes
    puts "Выберите номер маршрута к которому хотите добавить станцию"

    user_input = gets.chomp.to_i
    
    puts "Напишите название станции: "
    station_name = gets.chomp.to_s.downcase
    @routes[user_input - 1].add_station(station_name)
    puts "Станция #{station_name} добавлена"
  end

  #12
  def delete_station_from_route
    return unless show_routes
    puts "Выберите номер маршрута в котором хотите удалить станцию"
    show_routes
    user_input = gets.chomp.to_i
    
    puts "Напишите название станции:"
    station_name = gets.chomp.to_s.downcase
    @routes[user_input - 1].delete_station(station_name)
    puts "Станция #{station_name} удалена"
  end

  #13
  def train_move_next_station #todo
    return unless show_trains

    puts "Укажите индекс поезда, который отправится на следующую станцию"
    t_index = gets.chomp.to_i
    train = @trains[t_index]
    train.next_station
    train.move_next_station
    puts "Поезд отправился на следующую станцию"
  end

  #14
  def train_move_previous_station #todo
    return unless show_trains

    puts "Укажите номер поезда, который отправится на предыдущую станцию"
    t_index = gets.chomp.to_i
    train = @trains[t_index]
    train.previous_station
    train.move_previous_station
    puts "Поезд отправился на следующую станцию"
  end
end