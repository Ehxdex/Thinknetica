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
    puts "13. Отправить поезд на первую станцию"
    puts "14. Отправить поезд на след. станцию"
    puts "15. Отправить поезд на пред. станцию"
    puts "----------------------------------"
    puts "Для 'Выхода' нажмите любую клавишу."
    puts 
  end

  def start_application
    main_menu
  
    while  true do
      user_input = gets.chomp.to_i
      case user_input
      when 1
        create_train
        main_menu
      when 2
        create_station
        main_menu
      when 3
        create_route
        main_menu
      when 4
        show_trains
        main_menu
      when 5
        show_stations
        main_menu
      when 6
        show_routes
        main_menu
      when 7
        show_trains_on_station
        main_menu
      when 8
        add_wagon_to_train
        main_menu
      when 9
        remove_wagons_of_train
        main_menu
      when 10
        route_to_train
        main_menu
      when 11
        add_station_to_route
        main_menu
      when 12
        delete_station_from_route
        main_menu
      when 13
        move_train_to_station
        main_menu
      when 14
        train_move_next_station
        main_menu
      when 15
        train_move_previous_station
        main_menu
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
    number = gets.chomp.to_i
    puts "Какой тип поезда вы хотите создать? 'p(passenger)' или 'c(cargo)'"
    train_type = gets.chomp.to_s
    if train_type == "p"
      train_passenger = TrainPassenger.new(number)
      @trains << train_passenger
    elsif train_type == "c"
      train_cargo = TrainCargo.new(number)
      @trains << train_cargo
    else
      puts "Такого типа поезда не существует."
    end
    puts "Поезд создан"
  end

  #2
  def create_station
    puts "Напишите название станции: "
    station_name = gets.chomp.to_s.downcase
    station =  Station.new(station_name)
    @stations << station
    puts "Станция создана."
  end

  #3
  def create_route
    puts "Для создания маршрута укажите название станции отправления, остановок и станции прибытия"
    puts 
    puts "Список всех станций:"
    @stations.each { |s| puts "Название станции: #{s.name}" }
    puts 
    puts "Введите станцию отправления"
    first_station = gets.chomp.to_s
    puts "Введите станцию прибытия"
    last_station = gets.chomp.to_s

    route = Route.new(first_station,last_station) if @stations.include?(first_station) && @stations.include?(last_station)
  end

  #4
  def show_trains
    puts "Список поездов:"
    @trains.each { |train| puts "Номер поезда: #{train.number}, Тип поезда: #{train.type}, Количество вагонов: #{train.wagons_count}" }
  end
    
  def search_train
    show_trains

    puts "Укажите номер поезда к которому хотите добавить вагон(ы)"
    @t_number = gets.chomp.to_i

    puts "Количество вагонов которые хотите добавить?"
    @w_count = gets.chomp.to_i
  end 

  #5
  def show_stations
    return unless @stations
    puts "Список станций:"
    count = 0
    @stations.each { |s| puts "#{count += 1}. Название станции: #{s.name}" }
  end

  #6
  def show_routes
    @routes.each { |r| puts "Название станции: #{r}" }
  end

  #7
  def show_trains_on_station #to do
  end

  #8
  def add_wagon_to_train
    search_train
    
    @trains.each do |train|
      if train.number == @t_number
        @w_count.times { train.add_wagon(WagonPassenger.new) }
      elsif train.number == @t_number
        @w_count.times { train.add_wagon(WagonCargo.new) }
      end
    end      
    puts "Вагон(ы) добавлен(ы)"
  end

  #9
  def remove_wagons_of_train
    search_train
    
    @trains.each do |train|
      if train.number == @t_number 
        @w_count.times { train.pop() }
      elsif train.number == @t_number
        @w_count.times { train.pop()}
      end
    end      
    puts "Вагон(ы) добавлен(ы)"
  end

  #10 
  def route_to_train # todo
  end

  #11
  def add_station_to_route # todo
  end

  #12
  def delete_station_from_route #todo
  end

  #13
  def move_train_to_station #todo
  end

  #14
  def train_move_next_station #todo
  end

  #15
  def train_move_previous_station #todo
  end
end





