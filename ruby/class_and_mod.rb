module MMM
  class CCC
    def self.ddd
      "called ddd"
    end
  end
end

puts MMM::CCC
puts MMM::CCC.ddd.inspect

module Shared
  SHARED_VAR = "this is shared var"
  @@another_var = "another variable"
  puts @@another_var.inspect
end

puts Shared::SHARED_VAR
