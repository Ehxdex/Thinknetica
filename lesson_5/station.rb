require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :trains, :name

  def initialize(name)
    @name = name
  	@trains = []
    self.class.all << self
    register_instance
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

  def self.all
    @all ||= []
  end
end