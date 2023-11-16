class WagonCargo < Wagon
  attr_reader :volume

  def initialize(volume)
    @volume = volume
    @filled = 0
    validate!
    super(:cargo)
  end

  def fill_volume(fill)
    (free_volume - fill).negative? ? 'Недостаточно объема' : @filled += fill
  end

  def used_volume
    @filled
  end

  def free_volume
    @volume - @filled
  end

  protected

  def validate!
    errors = []
    errors << "Wagons volume can't be < 0" if @volume.negative?
    errors << "Wagons volume can't be nil" if @volume.nil?
    errors << "Used volume can't be more than wagons volume" if @filled > @volume
    raise ArgumentErrors, errors.join(', ') unless errors.empty?
  end
end
