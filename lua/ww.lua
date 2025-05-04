print("Hello Lua World!")

a = 1
b = a * 2

print(a, b)

--[[
this is block comment
--]]

-- TYPES and VALUES
print(type("hello"))
print(type(10.4*3))
print(type(10))
print(type(0.3e10))
print(type(type))
print(type(true))
print(type(nil))
-- Lua uses nil as a kind of non-value

a = "one string"
b = string.gsub(a, "one", "another")
print(a, b)

-- Multiple-line string
--[[
page = [[
<html>
    <head>
        <title>Lua HTML Page</title>
    </head>
    <bod>
        <h1>Hello</h1>
    </body>
</html>
]]
--]]

print(10 .. 20)
print(tostring(10) == '10')
print(10 .. "" == '10')

a = {}
k = "x"
a[k] = 10
a[20] = "twenty"
print(a["x"])
k = 20
print(a[k])

b = a
b["x"] = "fourty"
print(a["x"])
print(a.x)

for i=1,10 do
    a[i] = i
end
print(a[10])
print(a)
print(a[tonumber("5")], type(a))

-- Logical Operators
--
print(not nil)
print(not 0)
print(not false)
print(not "")
print(4 and 5)
print(nil and 123)
print(false and 123)
print(4 or 5)
print(nil or 5)

-- Concantenation
print("Hello " .. "Lua World")

-- Precedence order hight -> low
--[[
     ^
     not  - (unary)
     *   /
     +   -
     ..
     <   >   <=  >=  ~=  ==
     and
     or
--]]

-- Table Constructors
days = {"Sunday", "Monday", "Tuesday", "Wednesday",
        "Thursday", "Friday", "Saturday"}

print(days[4])

a = {x=0, y=0}
print(a.x)
a.x = nil -- remove the x
print(a.x)

-- We can mix record-style and list-style initializations in the same constructor
polyline = {color="blue", thickness=2, npoints=4,
             {x=0,   y=0},
             {x=-10, y=0},
             {x=-10, y=1},
             {x=0,   y=1}
           }
print(polyline[2].x)

opnames = {["+"] = "add", ["-"] = "sub",
           ["*"] = "mul", ["/"] = "div"}

i = 20; s = "-"
a = {[i+0] = s, [i+1] = s..s, [i+2] = s..s..s}

print(opnames[s])
print(a[22])

-- NOTE {x=0, y=0} === {["x"]=0, ["y"]=0}
-- NOTE {"red", "green", "blue"} === {[1]="red", [2]="green", [3]="blue"}
-- For zero-based array
days = {[0]="Sunday", "Monday", "Tuesday", "Wednesday",
        "Thursday", "Friday", "Saturday"}

print(days[1], days[0])

-- Trailing comma is okay
a = {[1]="red", [2]="green", [3]="blue",}
print(a[3])

-- Semicolon is still okay
a = {x=10, y=45; "one", "two", "three"}
print(a.y, a[3])

-- Multiple Assignment -> NOTE more frequent use is to collect multiple returns from function calls
a, b, c = 10, 20
print(a, b, c)

-- Swaping
a, b = b, a, "ignored"
print(a, b)

-- Local variables and Blocks
local i = 1
local res = ''
while i < 10 do
    local x = i*2
    res = res .. " > " .. x
    i = i + 1
end
print(res)

local a, b = 1, 10
if a < b then
    print(a)
    local a = 'this is local a'
    print(a)
end
print(a, b)

if a < b then c = 'a<b' else c = 'a>b' end
print(c)

-- Control structure
--
--[[
    if a<0 then a = 0 end

    if a<b then return a else return b end

    if line > MAXLINES then
      showpage()
      line = 0
    end


    if op == "+" then
      r = a + b
    elseif op == "-" then
      r = a - b
    elseif op == "*" then
      r = a*b
    elseif op == "/" then
      r = a/b
    else
      error("invalid operation")
    end
--]]

i = 0
repeat
    i = i + 1
until i > 10
print(i)

s = ''
for i=1,20,2 do
    s = s .. ' > ' .. i
end
print(s)

s = ''
for k,v in ipairs(days) do
    s = s .. ' > ' .. v .. '(' .. k .. ')'
end
print(s)

revDays = {}
for k,v in ipairs(days) do
    revDays[v] = k
end
print(revDays['Monday'])

-- NOTE ! if using ipairs it does not work
s = 'start -> '
for k in pairs(revDays) do
    s = s .. ' > ' .. k
end
print(s)

-- Functions
--
s, e = string.find("hello lua lua world", "lua")
print(s, e)

s, e = string.find("hello lua world", "tt")
print(s, e)

function maximum (a)
    local mi = 1 -- max index
    local m = a[mi] -- max value
    for i,v in ipairs(a) do
        if v > m then
            mi = i
            m = v
        end
    end
    return m, mi
end

a = {1,5,6,19,3,2,7}
print(maximum(a))

function foo0 () end                  -- returns no results
function foo1 () return 'a' end       -- returns 1 result
function foo2 () return 'a','b' end   -- returns 2 results

x,y = foo0()
print(x,y)
x,y = foo1()
print(x,y)
x,y,z = foo2()
print(x,y,z)

-- A function call that is not the last element in the list always produces one result:
x,y = foo2(), 20
print(x,y)
x,y = foo0(), 20, 30
print(x,y)

-- A constructor also collects all results from a call, without any adjustments
a = {foo2()}
print(a[1], a[2])

function unpack (t, i)
  i = i or 1
  if t[i] ~= nil then
    return t[i], unpack(t, i + 1)
  end
end

f = string.find
a = { "hello", "ll" }
print(f(unpack(a)))

-- variable number of arguments
function vf(...)
   return arg
end

res = vf{1,2,3,4}
res = vf{test=123}
print(res['test'], type(res))

-- Closure
function newCounter ()
  local i = 0
  return function ()   -- anonymous function
           i = i + 1
           return i
         end
end

c1 = newCounter()
print(c1())
print(c1())

c2 = newCounter()
print(c2())
print(c1())

-- Non-Global function
--
Lib = {}
Lib.foo = function (x,y) return x + y end
Lib.goo = function (x,y) return x - y end

print(Lib.foo(9, 10))
print(Lib.goo(9, 10))

-- equivalent to
Lib = {
  foo = function (x,y) return x + y end,
  goo = function (x,y) return x - y end
}

print(Lib.foo(9, 10))
print(Lib.goo(9, 10))

-- Or
Lib = {}
function Lib.foo (x,y)
  return x + y
end
function Lib.goo (x,y)
  return x - y
end

print(Lib.foo(9, 10))
print(Lib.goo(9, 10))

-- local function
local f = function(a, b)
    return a + b
end

print(f(6,5))

local g = function(a, b)
    s = f(a, b)
    return s * s
end

print(g(4,5))

local fact -- forward declaration
fact = function (n)
  if n == 0 then return 1
  else return n*fact(n-1)
  end
end

print(fact(5))

-- Proper Tail Calls -> A tail call happens when a function calls another as its last action
-- there is no limit on the number of "nested" tail calls that a program can make
--
-- example tail calls
function g ()
    return f()
end

table.getn = function(t) return #t end
-- Iterators and Closures
--
-- iter function
function list_iter (t)
  local i = 0
  local n = table.getn(t)
  return function ()
       i = i + 1
       if i <= n then return t[i] end
     end
end

t = {10, 20, 30}
local s = ""
for element in list_iter(t) do
    s = s .. " > " .. element
end

print(s)

-- String standard library
print(string.gsub("Hello World", "^Hello", ""))
