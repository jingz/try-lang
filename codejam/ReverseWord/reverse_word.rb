File.open("B-large-practice.in","r") do |f|
  n = f.readline.to_i 
  n.times do |i|
    o = f.readline.split(" ").reverse.join(" ")
    puts "Case ##{i+1}: #{o}" 
  end
end
