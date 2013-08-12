require "active_support/all"
p $:.count
module Upper
  def width
    @width 
  end
  def punch
    "punch"
  end
end

class Human
  class_attribute :catt
  @width = 50
  class << self
    attr_accessor :default_var
  end
  @@def_val = "test"
  include Upper
  extend Upper
  def initialize
    @width = 100 
    p @@def_val
  end
end


class Baby < Human
end

# h = Human.new.punch  # => punch
#

puts Human.new
#puts Baby.default_var
