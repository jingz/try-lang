map = {"e"=>"o", "j"=>"u", "p"=>"r", " "=>" ", "m"=>"l", "y"=>"a", "s"=>"n", "l"=>"g", "c"=>"e", "k"=>"i", "d"=>"s", "x"=>"m", "v"=>"p", "n"=>"b", "r"=>"t", "i"=>"d", "b"=>"h", "t"=>"w", "a"=>"y", "h"=>"x", "w"=>"f", "f"=>"c", "o"=>"k", "u"=>"j", "g"=>"v", "z"=>"q", "q"=>"z", "\n"=>"\n"}
File.open("A-small-attempt0.in") do |f|
  cases = f.readline.to_i 
  cases.times do |i|
    s = f.readline  
    out = "";
    s.size.times do |c|
      out += map[s[c]] 
    end
    puts "Case ##{i+1}: #{out}"
  end
end
