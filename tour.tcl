set x 1

while {$x < 10} {
    puts "x is $x"
    set x [expr {$x + 1}]
}


for {set i 0} {$i < 10} {incr i} {
    puts "I inside first loop: $i"
}


proc sum {a  b} {
    set x [expr { $a + $b }]
    return $x
}

puts "This is result of 5 + 4 [sum 5 4]"
