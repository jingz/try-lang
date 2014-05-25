require 'coffee_script'

scriptname = ARGV[0]
base_dir = File.dirname scriptname
compiled_script = scriptname.gsub('coffee','js') || ARGV[1]

File.open("#{base_dir}/#{compiled_script}",'w') do |f|
  f.write CoffeeScript.compile(File.read("#{base_dir}/#{scriptname}"))
end
