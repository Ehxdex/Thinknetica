require_relative 'company'

class Wagon
  include CompanyName
  
  attr_reader :type 
  
  def initialize(type)
    @type = type
  end
end