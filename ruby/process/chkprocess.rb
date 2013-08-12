#!/home/jing/.rvm/rubies/ruby-1.9.2-p290/bin/ruby

begin
  pid = File.read("test.pid").to_i
  Process.kill 0, File.read("test.pid").to_i
  puts "#{pid} still exist"
rescue Errno::ESRCH => e
  puts e.message
end
