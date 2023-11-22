require_relative 'accessors'
require_relative 'validation'

class X
  extend Accessors
  extend Validation

  attr_accessor_with_history :a, :b, :c

  strong_attr_accessor :d, :d.class
  strong_attr_accessor :e, :e.class
  strong_attr_accessor :f, :f.class

end

class Station
  extend Validation

  attr_accessor :name, :number, :station
  
  validate :name, :presence
  validate :number, :format, /A-Z{0,3}/
  validate :name, :type, :String
end
