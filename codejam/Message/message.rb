def to_digit(message, prev_key = nil)
  digit = []
  message.each_char do |c|
    n = c.ord - 97
    if n < 0 
      key = 0
      rep = 1
    elsif n <= 14
      key = n / 3 + 2
      rep = n % 3 + 1
    elsif n <= 18
      key = 7
      rep = (n - 15) % 4 + 1
      #7
    elsif n <= 21
      key = 8
      rep = (n - 19) % 3 + 1
    else 
      key = 9
      rep = (n - 22) % 4 + 1
    end
    # p c, n, key, rep
    if key == prev_key 
      digit << " #{key.to_s*rep}"
    else
      prev_key = key
      digit << "#{key.to_s*rep}"
    end
  end
  digit.join()
end

File.open("C-large-practice.in", "r") do |f|
  n = f.readline.to_i
  n.times do |i|
    digit = to_digit(f.readline.gsub("\n",""))
    puts "Case ##{i+1}: #{digit}" 
  end
end
