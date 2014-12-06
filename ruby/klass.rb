class Template
  def test
    "test in template" 
  end
end


class A
  puts "in class A"
  puts self
  puts self.class
end

animal = "Dog"
class << animal
  def speak
    "Hong!" 
  end
end

puts animal.speak

class Person
  @heart = true
  class << self
    attr_accessor :heart
  end
end

puts Person.heart
Person.heart = false
puts Person.heart

s = class << Template
  def self.xxx
    "xxx!" 
  end

  self
end
puts s

T = class << Person; self end
puts T

n = Class.new do
  self
end < Person
puts n.class
