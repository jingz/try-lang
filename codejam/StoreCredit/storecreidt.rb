def addup(credit, list)
  _list = list.dup
  _credit = credit
  _list.each_index do |i|
     next if _list[i] > credit 
     first = p
     _list.each_index do |_i|
        next if _i == i or list[_i] > credit or list[i] + list[_i] != credit
        return [i+1, _i+1]
     end
  end 
  "not found"
end


if $0 == __FILE__

# puts "case #1", addup(100, [5, 75, 25]) == [2, 3]
# puts "case #2", addup(200, [150, 24, 79, 50, 88, 345, 3]) == [1, 4]
# puts "case #3", addup(8, [2, 1, 9, 4, 4, 56, 90, 3]) == [4, 5]

# t1 = Time.now
File.open("A-large-practice.in","r") do |f|
  cases = f.readline.to_i
  line = 1
  cases.times do |i|
     credit =  f.readline.to_i
     n = f.readline
     items = f.readline.split(" ").map!{|x|x.to_i}
     a, b = addup credit, items
     puts "Case ##{i+1}: #{a} #{b}"
  end
end
# puts "time #{(Time.now - t1)}"

end
