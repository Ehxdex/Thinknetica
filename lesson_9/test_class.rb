require_relative 'accessors'

class X
  extend Accessors

  attr_accessors_with_history :vars
end
