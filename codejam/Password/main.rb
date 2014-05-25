def factorial(n)
  res = 1
  while(n > 0)
    res *= n 
    n -= 1
  end
  res
end

def choose(n,m)
  _n = n
  mark = [] 
  m.times do |x|
    mark << x+1 
  end
  res = []
  i = mark.count - 1
  while true
    ac = mark[i]
    if ac == _n
      i -= 1
      _n -= 1
    else
      res << mark.dup
      mark[i] = mark[i] + 1
    end
    break if _n == (n - m)
  end
  res
end

def swap(mark, n)
  ac = mark.last
end

File.open(ARGV[0]) do |f|
  cases = f.readline.strip!.to_i
  cases.times do |i|
    a,b = f.readline.strip!.split(" ").map(&:to_i)
    prop = f.readline.strip.split(" ").map(&:to_f)
    era = a+2
    canback = a
    ay = []
   
    aprop = [] 
    aprop << prop.reduce(&:+)
    a.times do |w|
      nwrong = w+1
      xcases = factorial(a)/factorial(nwrong)
      p choose(a, nwrong) 
    end
    canback.times do |c|
       
    end

    puts "Case ##{i+1}: " 
  end
end
