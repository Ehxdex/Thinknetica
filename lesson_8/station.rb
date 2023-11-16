require_relative 'instance_counter'
require_relative 'validation'


class Station
  include InstanceCounter
  include Validation

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    validate!
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

  def trains_info
    @trains.each {|train| yield(train)}
  end

  def self.all
    @all ||= []
  end

  protected

  def validate!
    errors = []
		errors << "Station name can't be nil" if @name.nil?
    errors <<  "Station name can't be empty" if @name.empty?
    raise ArgumentError, errors.join(', ') unless errors.empty?
  end
end