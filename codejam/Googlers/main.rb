def tri_result(score, surprising = false, best)
  low = score / 3
  n = score % 3
  tri = []
  if n == 2 and surprising and (low+2 <= 10) and best >= low+2
    return [[low+2, low, low] , true]
  elsif n == 1 and surprising and (low+1 <= 10) and (low-1 >= 0) and best >= low+2
    return [[low+1, low+1, low-1] , true]
  elsif n == 0 and surprising and (low+1 <= 10) and (low-1 >= 0) and best >= low+1 
    return [[low+1, low, low-1] ,true ] 
  else
    3.times do |i|
       if n > 0
         tri << (low+1)
         n -= 1
       else 
         tri << low
       end
    end
  end
  [tri, false]
end 
File.open("B-large.in") do |f|
  cases = f.readline.to_i
  cases.times do |i|
    args = f.readline.split(" ")     
    googles = args.shift
    surp = args.shift.to_i
    best = args.shift.to_i
    totals = args.map{|e|e.to_i}
    g = 0
    totals.sort!.reverse!
    totals.each do |score|
      tri , is_surp = tri_result(score, (surp > 0? true : false), best)
      surp -= 1 if is_surp
      g += 1 if tri.any?{|r| r >= best }  
    end
    puts "Case ##{i+1}: #{g}" 
  end
end
