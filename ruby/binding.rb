# test howto capture binding with different context using ruby-debug-base gem

require 'erb'
require 'ruby-debug-base'

Debugger.start

temp = <<-EOD
  this is value of X : <%= x %>
EOD

tp = ERB.new temp

# get binding

x = 1
b1 = binding_n()

# change value x 
x = 2
b2 = binding_n()

p tp.result b1 # should print 1
p tp.result b2 # should print 2


require 'pp'

# pp $"
pp $LOAD_PATH
