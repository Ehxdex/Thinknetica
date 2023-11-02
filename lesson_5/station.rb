class Station
  attr_reader :trains, :name

  @@station_object_count = 0

  def initialize(name)
    @name = name
  	@trains = []
    @@station_object_count += 1
  end

  def arrival_train(train)
    @trains << train
  end

  def departure_train(train)
    @trains.delete(train)
  end
  
  def trains_by_type
    @trains.each_with_object(Hash.new(0)) { |t, hh| hh[t.type] += 1 }
  end

  def all
    @@station_object_count
  end
end