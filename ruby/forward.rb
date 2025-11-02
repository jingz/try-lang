require "forwardable"
class Fw
  extend Forwardable
  # when dm is called it forward to [] method of @records instance variable
  def_delegator :@records, :[], :dm
  include Enumerable

  def initialize
    @records = ["one", "two", "three"] 
  end

end

x = Fw.new
puts x.dm(2)
