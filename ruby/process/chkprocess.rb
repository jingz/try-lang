begin
  pid = File.read("test.pid").to_i
  Process.kill 0, pid
  puts "#{pid} still exist"
rescue Errno::ESRCH => e
  puts e.message
end
