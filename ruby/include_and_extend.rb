module Speak
  def speak
    "speak"
  end
end

module Walk
  def walk
    "walk"
  end
end

class Person
  include Speak
  extend Walk
end

Person.speak rescue nil ##=> include_and_extend.rb:18:in `<main>': undefined method `speak' for Person:Class (NoMethodError)
puts Person.walk  #=> walk
person = Person.new
puts person.speak  #=> speak
puts person.walk rescue nil ##=> include_and_extend.rb:22:in `<main>': undefined method `walk' for #<Person:0x007fc670015f70> (NoMethodError)


## conclusion
## `include` a module for expanding methods of `class instances methods`
## `extend` a module for expanding methods of `class methods`
