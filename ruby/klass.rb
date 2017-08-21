class Template
  def test
    "test in template" 
  end
end


class A
  puts "in class A"  #=> in class A
  puts self  #=> A
  puts self.class  #=> Class
end

animal = "Dog"
class << animal
  def speak
    "Hong!" 
  end
end

puts animal.speak  #=> Hong!

class Person
  @heart = true
  class << self
    attr_accessor :heart
  end
end

puts Person.heart  #=> true
Person.heart = false
puts Person.heart  #=> false

s = class << Template
  def self.xxx
    "xxx!" 
  end

  self
end
puts s  #=> #<Class:Template>

T = class << Person; self end
puts T  #=> #<Class:Person>

n = Class.new do
  self
end < Person
puts n.class  #=> NilClass
