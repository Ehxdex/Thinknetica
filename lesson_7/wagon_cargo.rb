class WagonCargo < Wagon
  def initialize(volume)
    @volume = volume
    @filled = 0
    validate!
    super(:cargo)
  end

  def fill_volume(fill)
    free_volume - fill < 0 ? "Недостаточно объема" : @filled += fill
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
    errors << "Wagons volume can't be < 0" if @volume < 0
    errors << "Wagons volume can't be nil" if @volume.nil?
    errors << "Used volume can't be more than wagons volume" if @used_volume > @volume
    raise ArgumentErrors, errors.join(', ') unless errors.empty?) 
  end
end