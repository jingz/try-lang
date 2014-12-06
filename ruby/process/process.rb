cid = fork {
  File.open("test.pid", "w"){ |f| f.write $$; f.close }
  puts "Im child #{$$}"
  i = 0
  while(true) do
    break if i == 15 
    i += 1
    puts "child(#{$$}) say #{i}"
    sleep 1
  end
  exit
}

abort
Process.detach cid
puts "Im parent #{$$}"
x = 0
while(true) do
  x += 1
  puts "\t\t\tparent(#{$$},#{cid}) say #{x}"
  if x == 3
    puts "\t\t\tParent Die Here!"
    exit
  end
  sleep 3
end
