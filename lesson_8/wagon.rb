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
    errors = []
    errors << "Wagon type can't be nil'" if @type.nil?
    errors << "Wagon type can't be empty'" if @type.empty?
    errors << "Wagon type can only be 'passenger' or 'cargo'" unless @type == :passenger || @type == :cargo
    raise ArgumentError, errors.join(', ') unless errors.empty?
  end
end
