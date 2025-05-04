// PRIMITIVE TYPES
// ======================

// Boolean type
// ---------------------------------------------------------------------------------
let flag: boolean;
let yes = true;
let no = false;

console.log("Boolean type of yes and no:", { yes, no }); //=> Boolean type of yes and no: { yes: true, no: false }

// Number and BigInteger
// ---------------------------------------------------------------------------------
let x: number;
let y = 0;
let z: number = 123.456;
// let big: bigint = 100n;

console.log({ y, z }); //=> { y: 0, z: 123.456 }

// String type
// ---------------------------------------------------------------------------------
let s: string;
let empty = "";
let abc = "abc";

console.log({ empty, abc }); //=> { empty: '', abc: 'abc' }

// Enum type – Enumerations offer an easy way to work with sets of related constants
// ---------------------------------------------------------------------------------
enum ContractStatus {
  Permanent,
  Temp,
  Apprentice,
}

let employeeStatus: ContractStatus = ContractStatus.Temp;

console.log({ employeeStatus }); //=> { employeeStatus: 1 }
console.log(ContractStatus[employeeStatus]); //=> Temp

// Any Type - is the one type that can represent any JavaScript value with no constraints
// This can be useful when you're expecting a value from a third-party library
// or user inputs where the value is dynamic because the any type will allow you to reassign different types of values.
// ---------------------------------------------------------------------------------

let randomValue: any = 10;
randomValue = "Mateo";
randomValue = true;

console.log({ randomValue }); //=> { randomValue: true }

// Unknown Type – is similar to the any type in that any value is assignable to type unknown.
// However, you can't access any properties of an unknown type, nor can you call or construct them.
// ---------------------------------------------------------------------------------

let randomValue2: unknown = 10;
randomValue2 = true;
randomValue2 = "Meteo";

console.log(randomValue2.name); //=> undefined
console.log(randomValue2.toUpperCase()); //=> METEO

// Type assertion
// ---------------------------------------------------------------------------------

let r = "Meto";
let result = "";

// This checking is called 'Type guard'
if (typeof r === "string") {
  result = (r as string).toUpperCase();
} else {
  result = "Error – A string was expected here.";
}

console.log({ result }); //=> { result: 'METO' }

// Union types – A union type describes a value that can be one of several types
// This can be helpful when a value is not under your control (for example, values from a library, an API, or user input.)
// ---------------------------------------------------------------------------------
let m: number | boolean;
m = 20;
console.log({ m }); //=> { m: 20 }
m = true;
console.log({ m }); //=> { m: true }
m = "a string";
console.log({ m }); //=> { m: 'a string' }

// Defining literal types
// ---------------------------------------------------------------------------------
type testResult = "pass" | "fail" | "incomplete";
let myResult: testResult;
myResult = "incomplete"; //* Valid
myResult = "pass"; //* Valid
myResult = "failure"; //* Invalid

// Arrays
// ---------------------------------------------------------------------------------
const list: number[] = [1, 2, 3];
console.log({ list }); //=> { list: [ 1, 2, 3 ] }

// Tuples
// ---------------------------------------------------------------------------------
const person: [string, number] = ["Marcia", 24];
console.log({ person }); //=> { person: [ 'Marcia', 24 ] }

// try adding another item to array
person.push(true);

// Interface
// You can use interfaces to describe an object,
// naming and parameterizing the object's types,
// and to compose existing named object types into new ones.
// ---------------------------------------------------------------------------------
interface Employee {
  firstName: string;
  lastName: string;
  fullName(): string;
}

const employee: Employee = {
  firstName: "Emil",
  lastName: "Andersson",
  fullName(): string {
    return this.firstName + " " + this.lastName;
  },
};

console.log(employee.firstName); //=> Emil

interface IceCream {
  flavor: string;
  scoops: number;
}

// extend
interface Sundae extends IceCream {
  sauce: "chocolate" | "caramel" | "strawberry";
  nuts?: boolean;
  whippedCream?: boolean;
  instructions?: boolean;
}

// Indexable type
interface IceCreamArray {
  [index: number]: string;
}

let myIceCream: IceCreamArray;
myIceCream = ["chocolate", "vanilla", "strawberry"];
let myStr: string = myIceCream[0];
console.log(myStr); //=> chocolate

// Function
// ---------------------------------------------------------------------------------

// Named function
function addNumbers(x: number, y: number): number {
  return x + y;
}
addNumbers(1, 2);

// Anonymous function
let addNumbers1 = function (x: number, y: number): number {
  return x + y;
};

// Arrow function
let addNumbers2 = (x: number, y: number): number => x + y;

// Generic
// ---------------------------------------------------------------------------------

function getArray<T>(items: T[]): T[] {
  return new Array<T>().concat(items);
}

let numberArray = getArray([5, 10, 15, 20]);
let stringArray = getArray(["Cats", "Dogs", "Birds"]);
numberArray.push(25); // OK
stringArray.push("Rabbits"); // OK
numberArray.push("This is not a number"); // OK
stringArray.push(30); // OK

console.log(numberArray); //=> [ 5, 10, 15, 20, 25, 'This is not a number' ]
console.log(stringArray); //=> [ 'Cats', 'Dogs', 'Birds', 'Rabbits', 30 ]

class Car {
  make: string = "Generic Car";
  doors: number = 4;
}
class ElectricCar extends Car {
  make = "Electric Car";
  doors = 4;
}
class Truck extends Car {
  make = "Truck";
  doors = 2;
}
function accelerate<T extends Car>(car: T): T {
  let result = `All ${car.doors} doors are closed.`;
  result += `The ${car.make} is now accelerating!`;
  return result;
}

let myElectricCar = new ElectricCar();
result = accelerate<ElectricCar>(myElectricCar);
console.log(result); //=> All 4 doors are closed.The Electric Car is now accelerating!
let myTruck = new Truck();
result = accelerate<Truck>(myTruck);
console.log(result); //=> All 2 doors are closed.The Truck is now accelerating!
