class WagonPassenger < Wagon
  attr_reader :used_seats, :seats

  def initialize(seats)
    @seats = seats
    @used_seats = 0
    validate!
    super(:passenger)
  end

  def fill_wagon
    @used_seats + 1 > @seats ? 'Недостаточно мест' : @used_seats += 1
  end

  def free_seats
    @seats - @used_seats
  end

  protected

  def validate!
    errors = []
    errors << "Wagons seats can't be < 0" if @seats.negative?
    errors << "Wagons seats can't be nil" if @seats.nil?
    errors << "Used seats can't be more than wagons seats" if @used_seats > @seats
    raise ArgumentErrors, errors.join(', ') unless errors.empty?
  end
end
