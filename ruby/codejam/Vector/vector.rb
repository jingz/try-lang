File.open("A-large-practice.in","r") do |f|
  ncases = f.readline.strip.to_i
  ncases.times do |i|
    n = f.readline.strip.to_i 
    va = f.readline.strip.split(" ").map &:to_i
    vb = f.readline.strip.split(" ").map &:to_i
    va.sort!
    vb.sort!.reverse!
    sum = 0
    n.times do |k|
      sum += va[k] * vb[k] 
    end
    puts "Case ##{i+1}: #{sum}"
  end
end
