File.open("C-large.in") do |f|
  cases = f.readline.to_i 
  cases.times do |i|
    args = f.readline.split(" ").map &:to_i 
    a = args[0]
    b = args[1]
    r = args[0]..args[1]
    ok = []
    r.to_a.each do |n|
      digits = n.to_s.size   
      rounds = digits - 1
      if rounds > 0
        m = n.to_s
        rounds.times do |_|
          swapper = m[-1].to_i
          m = m[-1] + m[0..-2]
          next if swapper == 0 or m.to_i > b or m.to_i < a
          ok << n.to_s+m if n < m.to_i
        end
      end
    end
    puts "Case ##{i+1}: #{ok.uniq.count}"
  end
end
