main () {
    // # General Concept
    print("hello this is from dart.");  //=> hello this is from dart.

    var i;
    i = 10;
    i = 'string10'; // change value
    print("This is $i with string intepolation.");  //=> This is string10 with string intepolation.

    dynamic d = null;
    d = 'dynamic string';
    print("Dynamic var $d");  //=> Dynamic var dynamic string

    int n = 0;
    print("The number of n is $n.");  //=> The number of n is 0.

    final f = "Final variable cannot change its value";
    // try to change it
    // f = 'change'; // will get Error: Setter not found: 'f' from this line

    const c = 10000;
    // try to change c
    // c = 99999;  // must get Error: Setter not found: 'c' from this line

    // use type after const
    const double atm = 1.13 * c;
    print(atm);  //=> 11299.999999999998

    // final also assign with const
    final foo = const [];
    print(foo);  //=> []

    // foo = [1, 2, 3]; // must get Error: Setter not found: 'foo' from this line

    // # Valiables
    // ## Number

    int my_age = 33;
    int my_dept = -600;
    double an_dbl = 123.01;
    double my_money = .30e3;
    print(my_money == 300);  //=> true

    int hex_age = 0x0021;
    print(hex_age == my_age);  //=> true

    // convert string into number
    String s = '100';
    print("this is string '$s'");  //=> this is string '100'

    int conv = int.parse(s);
    print(conv == 100);  //=> true
    double convd = double.parse(s);
    print(convd);  //=> 100.0

    // now convert number ---> String
    String convs = conv.toString(); // like javascript very much
    print(convs);  //=> 100

    String pi = 3.414159.toStringAsFixed(3);
    print(pi);  //=> 3.414

    // int can be operated with bitwise
    int bit = 4;
    print(bit << 1);  //=> 8

    // ## String is a sequence of  UTF-16 code units

    String s1 = 'With single qoute';
    String s2 = "With double qoute";
    String s3 = "With escape double qoute (\") ";
    String s4 = 'Or wrapped inside single qoute ("). It can do vise versa.';
    print(s1);  //=> With single qoute
    print(s2);  //=> With double qoute
    print(s3);  //=> With escape double qoute (") 
    print(s4);  //=> Or wrapped inside single qoute ("). It can do vise versa.

    print("Interpolation #1 $s1");  //=> Interpolation #1 With single qoute
    print("Interpolation #2 ${s1.toUpperCase()}");  //=> Interpolation #2 WITH SINGLE QOUTE
    // ! #2 is very like JS and bash-style wrapping command

    // String operator
    String concat = s1 + ' : ' + s2;
    print(concat);  //=> With single qoute : With double qoute

    // multi-line
    String multi_line = '''
This is multi-line string like python
Very handy.
Last line''';

    print(multi_line);  //=> This is multi-line string like python
          // print hack  //=> Very handy.
          // print hack  //=> Last line

    // raw-string like python
    var raw = r'In a raw string, not even \n gets special treatment.';
    print(raw);  //=> In a raw string, not even \n gets special treatment.


    // ## Boolean

    bool b = true;
    print(b);  //=> true

    print(' '.isEmpty);  //=> false
    print(''.isEmpty);  //=> true
    print(0 == false);  //=> false
    var nan = 0 / 0;
    print(nan.isNaN);  //=> true


    // ## List
    var list = [1, 3, 5];
    print(list.length);  //=> 3
    print(list[0]);  //=> 1

    // re-assign
    list[1] = 100;
    print(list[1]);  //=> 100


    // ## Set look like python
    var ss = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
    var msMachines = <String>{'surface pro', 'surface book', 'surface labtob'};

    print(msMachines);  //=> {surface pro, surface book, surface labtob}
    msMachines.add('surface go');
    print(msMachines);  //=> {surface pro, surface book, surface labtob, surface go}
    print(msMachines.length);  //=> 4


    // ## Map is like hash in JSON
    // both key and value can be any type of object

    var releaseMachines = {
        '2018': const ['surface pro 6', 'surface book 2'],
        2017: 'surface pro 5'
    };

    print(releaseMachines);  //=> {2018: [surface pro 6, surface book 2], 2017: surface pro 5}

    // or start map with empty first
    var colorEmotions = new Map(); // ! new keyword is optional

    colorEmotions['hot'] = const ['red', 'orange'];
    colorEmotions['cool'] = const ['lightblue', 'white', 'lightgreen'];
    print(colorEmotions);  //=> {hot: [red, orange], cool: [lightblue, white, lightgreen]}


    // ## Runes are like string but with UTF-32 code points
    var runes = new Runes('\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
    print(new String.fromCharCodes(runes));  //=> ♥  😅  😎  👻  🖖  👍


    // ## Symbol is compile-time constant
    #sampleSymbol;
    print(#sampleSymbol == #sampleSymbol);  //=> true


    // ## Function
    String hello(String name) {
        return "Hello " + name;
    }

    print(hello('My Subscribers!'));  //=> Hello My Subscribers!

    // with omit return type annotation
    hi(String name) {
        return "Informal greeting to " + name;
    }

    print(hi('My Dear!'));  //=> Informal greeting to My Dear!

    // or like arrow function in javascript and omitting return-type also work!
    String greet(String name) => "Greeting " + name;
    print(greet('Arrow-Like-JS Function'));  //=> Greeting Arrow-Like-JS Function


    // ### Optional Parameter

    timeGreeting(String name, {includeTime: false}) {
        if (includeTime) {
            return "Morning Greeting " + name;
        }
        return greet(name);
    }

    print(timeGreeting('Alexa'));  //=> Greeting Alexa
    print(timeGreeting('Cortana', includeTime: true));  //=> Morning Greeting Cortana


    // optional positional parameter
    politeGreeting(String name, [bool isPolite]) {
        if (isPolite != null && isPolite) {
            return "Dear ${greet(name)}";
        }
        return greet(name);
    }

    print(politeGreeting('Momy'));  //=> Greeting Momy
    print(politeGreeting('Momy', true));  //=> Dear Greeting Momy


    // default valur for named parameter
    what(String name, {bool bold = false, bool hidden = false}) {
        return "this name is $name bold '$bold' and hidden '$hidden'";
    }

    print(what('Test', bold: true));  //=> this name is Test bold 'true' and hidden 'false'


    // ## ..

    var ddString = 'dot dot string';
    print(ddString.toString()..toUpperCase());  //=> dot dot string

    // function as first-class objects
    newFunc() => 'hi';
    print(newFunc);  //=> Closure: () => String

    // assing annonymous function to a variable
    var fn = (msg) => "this message $msg";
    print(fn('Hello'));  //=> this message Hello

    var colors = const ['red', 'green', 'blue'];
    colors.forEach((color) {
        print("at index ${colors.indexOf(color)} painted with color '$color'");  //=> at index 0 painted with color 'red'
        // print hack  //=> at index 1 painted with color 'green'
        // print hack  //=> at index 2 painted with color 'blue'
    });

    // Function that return a funtion
    // look like js but 

    returnFunc() {
        return (msg) => "recieved $msg";
    }

    print(returnFunc()('yo yo !'));  //=> recieved yo yo !

    // if nothing returned from a function 'null' would be.
    nullFn() {}
    print(nullFn() == null);  //=> true


    // ### Operators
    // ~/ is interesting operator for me
    // is! mean is not
    // as mean casting
    // ??= assign if null

    int plus = 0;
    print(plus++);  //=> 0
    print(plus);  //=> 1
    print(--plus);  //=> 0
    print(~19);  //=> -20

    int aa = 4;
    int bb = 9;
    print(aa + bb);  //=> 13
    print(aa - bb);  //=> -5
    print(aa * bb);  //=> 36
    print(bb ~/ aa);  //=> 2
    print(bb % aa);  //=> 1

    print(aa is! String);  //=> true
    print(aa is! int);  //=> false
    print((aa as int).toString() + ' is now ${aa.toString().runtimeType}');  //=> 4 is now String

    int nullA;
    nullA ??= 10;
    print(nullA);  //=> 10
    
    // compound assignment
    // ^= xor

    int cm = 2;
    cm += 2;
    print(cm);  //=> 4
    cm ^= 10;
    print(cm);  //=> 14
    cm <<= 2;
    print(cm);  //=> 56

    String playerName([String name]) => name ?? 'Guest';
    print(playerName());  //=> Guest
    print(playerName('Example'));  //=> Example


    // Classes – Declaration is below
    Person p = new Person('Sarunyoo', 'Chobpanich', 33);
    print(p);  //=> Instance of 'Person'
    print(p.display());  //=> Sarunyoo Chobpanich with 33
    p.fullName = "Ooynaras Hcinapbohc";
    print(p.display());  //=> Ooynaras Hcinapbohc with 33

    // mixin
    print(p.walk());  //=> walk walk
    
    print(Person.totalPeople);  //=> 1

    var mrA = new Person('Marker', "Baa", 23);
    print(mrA.display());  //=> Marker Baa with 23

    print(Person.totalPeople);  //=> 2
    print(Person.getPopulation());  //=> Total number of population is 2 people

}


// Classes


enum gender { MALE, FEMALE }

mixin Walkable {
    walk () {
        return "walk walk";
    }
}

class Person with Walkable {
    // static variable is a class-wide state or constants
    static int totalPeople = 0;
    String firstName;
    String lastName;
    int age;

    // constructor
    Person(firstName, lastName, age) {
        totalPeople += 1;

        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
    }

    // class method
    static String getPopulation () {
        return "Total number of population is ${Person.totalPeople} people";
    }

    // instance method
    String display () {
        return "${this.fullName} with ${this.age}";
    }

    // Getter Setter
    String get fullName => "${this.firstName} ${this.lastName}";
    set fullName(String fullName) {
        var _arrFullName = fullName.split(' ');
        this.firstName = _arrFullName[0];
        this.lastName = _arrFullName[1];
    }

    // @override
    // void noSuchMethod(Invocation invocation) {
    //     print("Method Missing: ${invocation.memberName}");
    // }
}
