// import module is like python
import Cocoa

// Variable (var)
// Constaints (let)

let greeting = "Hello, World !"
println(greeting);  //=>  Hello, World !

var firstVar = "the first variable"
println(firstVar)  //=>  the first variable

let ไทย = "Thai Name"
println(ไทย)  //=>  Thai Name
let pi = 3.414
println(pi)  //=>  3.414
let `class` = "override reserved word"
println(`class`);  //=>  override reserved word
let explicitDouble: Double = 77 
println(explicitDouble)  //=>  77.0
let casting = "Hello, PI is \(pi)"
// cannot covert pi to String
println(casting);  //=>  Hello, PI is 3.414

// Build Specific values
#if false
    let buildValue = 5
#else
    let buildValue = 3
#endif
println("Build value is \(buildValue)")  //=>  Build value is 3

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
        println("has the prefix opt")  //=>  has the prefix opt
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
println(anyObjectVar)  //=>  7
anyObjectVar = "changed to string"
println(anyObjectVar)  //=>  changed to string

// Array
var shoppingList = ["catfist", "water", "milk"]
println(shoppingList[2])  //=>  milk
let emptyString = [String]() // let == immutable
let emptyArray = Array<String>()
var emptyMutableArr = [String]()

// Dictionary
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]

println(occupations["Kaylee"])  //=>  Optional("Mechanic")
occupations["Jayne"] = "Wizard"
let emptyDict = [String: Float]()
let emptyDict2 = Dictionary<String, Float>()
var emptyDict3 = [String: Float]()

let arr = [1, 2, 4, 5, 6]
println(arr)  //=>  [1, 2, 4, 5, 6]
for v in arr {
    // loop thru arr
}

for (name, occ) in occupations {
    // loop thru dict
}

for i in -1...shoppingList.count {
    // loop thru range
}
println(shoppingList[0...1])  //=>  [catfist, water]

// while
var i = 1
while i < 10 {
    i++
}
println(i)  //=>  10

do {
    if i == 20 {
        println(i)  //=>  20
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
println(res);  //=>  Hello Jing, Enjoy Friday.

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
println(res)  //=>  Hello Jing, Enjoy extra running on Sunday !!

// returning tubles
func randomTuple() -> (Double, Double, Double) {
    var r = arc4random() // casting type
    return (Double(r), 4.3, 5.3)
}

println(randomTuple())  //=>  (1629857068.0, 4.3, 5.3)
var (a, b, c) = randomTuple()
println(a)  //=>  1909597147.0
println(b)  //=>  4.3
println(c)  //=>  5.3
var t = randomTuple()
println(t.0)  //=>  3020276998.0
println(t.2)  //=>  5.3

// args ... 3 dots
func setup(args: Int...) -> (String, String) {
    var first = args[0]
    var n = args.count
    return ("First args is \(first)", "number of memebers is \(n)")
}
println(setup(1,2,3,5,6))  //=>  (First args is 1, number of memebers is 5)

// passing and returning func
// return pattern is (types of args, type of returning)
func makeIncrementer() -> ((Int, Int) -> Int) {
    func addOne(number: Int, multi: Int) -> Int {
        return 1 + number * multi
    }
    return addOne
}
var inc = makeIncrementer()
println(inc(3, 2));  //=>  7

// passing reference
func swapInt(inout a: Int, inout b: Int) {
    let tempA = a
    a = b
    b = tempA
}

var iA = 6
var iB = 9
swapInt(&iA, &iB);
println(iA)  //=>  9
println(iB)  //=>  6

// Closures
var numbers = [1, 2, 3]
numbers = numbers.map({ number in 4 * number })
println(numbers)  //=>  [4, 8, 12]
numbers = sorted(numbers){ $0 > $1 }
println(numbers)  //=>  [12, 8, 4]
numbers = sorted(numbers, <)
println(numbers)  //=>  [4, 8, 12]

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
println(sentence)  //=>  Jane having Dog

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
println(s.display())  //=>  This shape is Square

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
println(ss.display())  //=>  This Block square having area 25.0 sq.

func yordered(#aa: String, #bb: String) -> String {
    return "ok \(aa) \(bb)"
}

println(yordered(aa: "B", bb: "A"))  //=>  ok B A

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
println(cir.display())  //=>  This wheel circle having area 78.54.

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
println(et.display());  //=>  An equilateral triangle with sides of length 4.0
et.perimeter = 9
println(et.display());  //=>  An equilateral triangle with sides of length 3.0

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
println(ts.square.sideLength)  //=>  5.0
ts = TriangleAndSquare(size: 15, name: "Mixer")
println(ts.triangle.sideLength)  //=>  15.0

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
println(ace.display())  //=>  ace
println(ace.rawValue);  //=>  1
let queen = Rank.Queen
println(queen.rawValue)  //=>  12
println(ace.compareWith(Rank.Queen))  //=>  -1
// Convertible
let fromRaw = Rank(rawValue: 12)
println(fromRaw?.display())  //=>  Optional("queen")

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
println(asuit.display())  //=>  hearts
println(asuit.color())  //=>  red

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
println(card.display());  //=>  3 of spades

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
println(serveRes)  //=>  Warning... There are something out of scope.

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
println(simclass.description)  //=>  This a simple class. adjust called

// struct with protocol
struct SimpleStruct: AProtocol {
    var description: String = "This is a structure."
    mutating func adjust() {
        description += " adjust structure"
    }
}

var simstruct = SimpleStruct()
simstruct.adjust()
println(simstruct.description)  //=>  This is a structure. adjust structure

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
println(simenum.description)  //=>  adjusted

// Extension
extension Int: AProtocol {
    var display: String {
        return "The number \(self)"
    }

    mutating func adjust() {
        self += 99
    }
}

var ii: Int = 1
println(ii.display)  //=>  The number 1
ii.adjust()
println(ii.display)  //=>  The number 100

extension Double {
    // absolute
    var abs: Double {
        if self < 0 {
            return -self
        } else {
            return self
        }
    }
}

var dd: Double = -19.99
println(dd.abs)  //=>  19.99

let pt: AProtocol = simclass
println(pt.description)  //=>  This a simple class. adjust called

// Generic

func repeat<ItemType>(item: ItemType, items: Int) -> [ItemType] {
    var res = [ItemType]()
    for i in 1...items {
        res.append(item)
    }
    return res
}
println(repeat("repeated word!", 4))  //=>  [repeated word!, repeated word!, repeated word!, repeated word!]
println(repeat(9, 3))  //=>  [9, 9, 9]

enum OptionalValue<T> {
    case None
    case Some(T)
}

var possibleInteger: OptionalValue<Int> = .None
println(possibleInteger)  //=>  (Enum Value)
possibleInteger = .Some(100)
println(possibleInteger)  //=>  (Enum Value)

func anyCommonElements <T, U where T: SequenceType, U: SequenceType, 
                                   T.Generator.Element: Equatable,
                                   T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

println(anyCommonElements([1,2,3], [2]))  //=>  true
println(anyCommonElements([4,3,5], [2]))  //=>  false

// experimental : http://stackoverflow.com/questions/24027271/use-a-function-to-find-common-elements-in-two-sequences-in-swift
func findAnyCommon <T, U where T: SequenceType, U: SequenceType, 
                               T.Generator.Element: Equatable,
                               T.Generator.Element == U.Generator.Element> (l: T, r: U) -> Array<T.Generator.Element> {
                                    var res = Array<T.Generator.Element>()
                                    for _l in l {
                                        for _r in r {
                                            if _l == _r {
                                                res.append(_l)
                                            }
                                        }
                                    }

                                    return res
                               }

println(findAnyCommon([4, 5, 6], [5, 6, 7]))  //=>  [5, 6]

