require "v8"

cxt = V8::Context.new
console = {
  log: lambda do |*js|
    # _ctx = V8::Context.new 
    _ctx = js[0]
    _msg = js[1]
    p "log: #{_msg}"
  end
}

cxt["console"] = console
cxt["alert"] = console[:log]

jsscript = ARGV[0]

puts cxt.load(jsscript)
