class TrainPassenger < Train
  def initialize(number)
    super(number, :passenger)
  end

  def add_wagon(wagon)
    return unless self.type == wagon.type
    super(wagon)
  end
end
