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

  def trains_by_type(type) # to do
    count = 0
    @trains.each do |train|
      if train.type == type
        count += 1     
      end
    end
    return "На станции #{type}: #{count}"
  end
end