require_relative 'instance_counter'
require_relative 'validation'


class Station
  include InstanceCounter
  include Validation

  attr_reader :trains, :name

  def initialize(name)
    @name = name
  	@trains = []
    self.class.all << self
    register_instance
    validate!
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

  protected

  def validate!
		raise "Station can't be nil" if @name.nil?
  end
end