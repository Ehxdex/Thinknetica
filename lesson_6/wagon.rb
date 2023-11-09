require_relative 'company'
require_relative 'validation'

class Wagon
  include CompanyName
  include Validation
  
  attr_reader :type 
  
  def initialize(type)
    @type = type
    validate!
  end

  protected

  def validate!
    raise "Wagon type can only be 'passenger' or 'cargo'" unless @type == :passenger or @type == :cargo
  end
end