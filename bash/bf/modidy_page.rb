#!/Users/jing/.rvm/rubies/ruby-1.9.2-p320/bin/ruby

File.open('data.dat', 'r') do |f|
  puts f.read
end
