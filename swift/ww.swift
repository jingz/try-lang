// import module is like python
import Cocoa

// Variable (var)
// Constaints (let)

let greeting = "Hello, World !"
println(greeting);

var firstVar = "the first variable"
println(firstVar)

let ไทย = "Thai Name"
println(ไทย)
let pi = 3.414
println(pi)
let `class` = "override reserved word"
println(`class`);
let explicitDouble: Double = 77 
println(explicitDouble)
let casting = "Hello, PI is \(pi)"
// cannot covert pi to String
println(casting);

// Build Specific values
#if false
    let buildValue = 5
#else
    let buildValue = 3
#endif
println("Build value is \(buildValue)")

/* 
   Optionals are a swift language feature that allows you 
   to store a `Some` or `None` value.
   Because Swift requires every property to have a value, 
   even nil must be explicitly stored as Optional Value
   Optional<T> is enum
*/

var someOptionalString: String? = "optional"
var someOptString: Optional<String> = "optional"

if someOptionalString != nil {
    if someOptionalString!.hasPrefix("opt") {
        println("has the prefix opt")
    }

    let empty = someOptionalString?.isEmpty
}
someOptionalString = nil

// implicitly unwrapped optional
var unwrappedString: String! = "value is expected."
var unwrapped: ImplicitlyUnwrappedOptional<String> = "value is expected."

if let someOptionalStringConst = someOptionalString {
    if someOptionalStringConst.hasPrefix("ok") {
        // does not have the prefix
    }
}

// AnyObject type is == id
var anyObjectVar: AnyObject = 7
println(anyObjectVar)
anyObjectVar = "changed to string"
println(anyObjectVar)

// Array
var shoppingList = ["catfist", "water", "milk"]
println(shoppingList[2])
let emptyString = [String]() // let == immutable
let emptyArray = Array<String>()
var emptyMutableArr = [String]()

// Dictionary
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]

println(occupations["Kaylee"])
occupations["Jayne"] = "Wizard"
let emptyDict = [String: Float]()
let emptyDict2 = Dictionary<String, Float>()
var emptyDict3 = [String: Float]()

let arr = [1, 2, 4, 5, 6]
println(arr)
for v in arr {
    // loop thru arr
}

for (name, occ) in occupations {
    // loop thru dict
}

for i in -1...shoppingList.count {
    // loop thru range
}
println(shoppingList[0...1])

// while
var i = 1
while i < 10 {
    i++
}
println(i)

do {
    if i == 20 {
        println(i)
    }
    i++
} while i < 21


// Switch like JAVASCRIPT
// They support String, object instancesm and primitives (Int, Double, etc)
let veg = "red peper"
switch veg {
    case "celery":
        let comment = "add some raisings and make ants on a log"
    case "cucumber", "watercress":
        let comment = "that would make a godd tea sandwich."
    case let loc where loc.hasSuffix("peper"):
        let comment = "Is it a spicy \(loc)"
    default:
        let comment = "Everything."
}

// Functions : are a first-class type, meaning they ca be nested
// in functions and can be passed around
func greeting(name: String, day: String) -> String {
    return "Hello \(name), Enjoy \(day)."
}
var res: AnyObject = greeting("Jing", "Friday");
println(res);

// *** Interesting stack overflow about naming arguments
// * http://stackoverflow.com/questions/24045890/why-does-a-function-call-require-the-parameter-name-in-swift
// * functions behave differently 
// * when defined as true functions outside a class, 
// * and when defined as methods. Moreover, init methods have a special rule.

// naming parameters and redirect local parameter name
func extraGreeting(#requiredName: String, day d: String) -> String {
    // d!! and requriedName!!
    return "Hello \(requiredName), Enjoy extra running on \(d) !!"
}
res = extraGreeting(requiredName: "Jing", day: "Sunday");
println(res)

// returning tubles
func randomTuple() -> (Double, Double, Double) {
    var r = arc4random() // casting type
    return (Double(r), 4.3, 5.3)
}

println(randomTuple())
var (a, b, c) = randomTuple()
println(a)
println(b)
println(c)
var t = randomTuple()
println(t.0)
println(t.2)

// args ... 3 dots
func setup(args: Int...) -> (String, String) {
    var first = args[0]
    var n = args.count
    return ("First args is \(first)", "number of memebers is \(n)")
}
println(setup(1,2,3,5,6))

// passing and returning func
// return pattern is (types of args, type of returning)
func makeIncrementer() -> ((Int, Int) -> Int) {
    func addOne(number: Int, multi: Int) -> Int {
        return 1 + number * multi
    }
    return addOne
}
var inc = makeIncrementer()
println(inc(3, 2));

// passing reference
func swapInt(inout a: Int, inout b: Int) {
    let tempA = a
    a = b
    b = tempA
}

var iA = 6
var iB = 9
swapInt(&iA, &iB);
println(iA)
println(iB)

// Closures
var numbers = [1, 2, 3]
numbers = numbers.map({ number in 4 * number })
println(numbers)
numbers = sorted(numbers){ $0 > $1 }
println(numbers)
numbers = sorted(numbers, <)
println(numbers)

// Object And Class
// Structures have an auto-generated (implicit) designated initializer
struct NamesTable {
    let names = [String]()
    let pets = [String]()
    subscript(index: Int) -> String {
        return "\(names[index]) having \(pets[index])"
    }
}

let nt = NamesTable(names: ["John", "Jane"], pets: ["Cat", "Dog"])
let sentence = nt[1]
println(sentence)

public class Shape {
    var name: String
    var numberOfSides: Int = 0

    init(name: String) {
        self.name = name    
    }

    // deinit for deinitializer

    public func getArea() -> Int {
        return 0;
    }

    func display() -> String {
        return "This shape is \(self.name)"
    }
}
var s = Shape(name: "Square")
println(s.display())

// inheritance
class Square: Shape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    // override a function
    override func display() -> String {
        return "This \(self.name) square having area \(self.area()) sq."
    }
}

var ss = Square(sideLength: 5, name: "Block")
println(ss.display())

func yordered(#aa: String, #bb: String) -> String {
    return "ok \(aa) \(bb)"
}

println(yordered(aa: "B", bb: "A"))

import Darwin // for PI
class Circle: Shape {
    var radius: Double
    var π = M_PI
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }

    func area() -> Double {
        return π * pow(self.radius, 2);
    }

    override func display() -> String {
        var apprArea = String(format: "%0.2f", self.area())
        return "This \(self.name) circle having area \(apprArea)."
    }
}

var cir = Circle(radius: 5, name: "wheel")
println(cir.display())

class EquilateralTriangle: Shape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get { return 3.0 * sideLength }
        set { sideLength = newValue / 3.0 }
    }

    override func display() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var et = EquilateralTriangle(sideLength: 4, name: "Pri")
println(et.display());
et.perimeter = 9
println(et.display());

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        // before create triangle assign side length to square
        willSet { square.sideLength = newValue.sideLength }
    }
    var square: Square {
        willSet { triangle.sideLength = newValue.sideLength }
    }

    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var ts = TriangleAndSquare(size: 5, name: "Mixer")
println(ts.square.sideLength)
ts = TriangleAndSquare(size: 15, name: "Mixer")
println(ts.triangle.sideLength)

// Enumerations and Structures
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func display() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }

    func compareWith(r: Rank) -> Int {
        var a = self.rawValue
        var b = r.rawValue

        if a == b {
            return 0
        } else if a > b {
            return 1
        } else {
            return -1
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue
println(ace.display())
println(ace.rawValue);
let queen = Rank.Queen
println(queen.rawValue)
println(ace.compareWith(Rank.Queen))
// Convertible
let fromRaw = Rank(rawValue: 12)
println(fromRaw?.display())

enum Suit {
    case Spades, Hearts, Diamonds, Clubs

    func display() -> String {
        switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }

    func color() -> String {
        switch self {
            case .Spades, .Clubs:
                return "black"
            case .Hearts, .Diamonds:
                return "red"
        }
    }
}

let asuit = Suit.Hearts
println(asuit.display())
println(asuit.color())

// Struct
/*** The most importance differences between structures and classes
     is that structures are `always copied when they are passed around in ur code` */
struct Card {
    var rank: Rank
    var suit: Suit

    func display() -> String {
        return "\(rank.display()) of \(suit.display())"
    }
}

var card = Card(rank: .Three, suit: .Spades);
println(card.display());

enum ServerResponse {
    case Result(String, String)
    case Error(String)
    case Warning(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let error = ServerResponse.Error("Out of cheese.")
let warning = ServerResponse.Warning("There are something out of scope.")

var serveRes: String
switch warning {
    case .Result(let sunrise, let sunset):
        serveRes = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    case let .Error(error):
        serveRes = "Failure... \(error)"
    case let .Warning(warn):
        serveRes = "Warning... \(warn)"
}
println(serveRes)

// Protocol
protocol AProtocol {
    var description: String { get }
    mutating func adjust()
}

// using protocol
class SimpleClass: AProtocol {
    var description: String = "This a simple class."
    var anotherVar: Int = 1
    func adjust() {
        description += " adjust called"
    }
}

var simclass = SimpleClass()
simclass.adjust()
println(simclass.description)

// struct with protocol
struct SimpleStruct: AProtocol {
    var description: String = "This is a structure."
    mutating func adjust() {
        description += " adjust structure"
    }
}

var simstruct = SimpleStruct()
simstruct.adjust()
println(simstruct.description)

// enum with protocol
// ** experimental : http://stackoverflow.com/questions/24011170/how-to-make-an-enum-conform-to-a-protocol-in-swift
enum SimpleEnum: AProtocol {
    case Base, Adjusted

    var description: String { get { return self.getDescription() } }

    func getDescription() -> String {
        switch self {
            case .Base:
                return "base"
            case .Adjusted:
                return "adjusted"
            default:
                return "default"
        }
    }

    mutating func adjust() {
        self = SimpleEnum.Adjusted
    }
}

var simenum = SimpleEnum.Base
simenum.adjust()
println(simenum.description)
