class TrainCargo < Train
  def initialize(number)
    super(number, :cargo)
  end

  def add_wagon(wagon)
    return unless self.type == wagon.type
    super(wagon)    
  end
end