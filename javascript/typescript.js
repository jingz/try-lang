// PRIMITIVE TYPES
// ======================
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
// Boolean type
// ---------------------------------------------------------------------------------
var flag;
var yes = true;
var no = false;
console.log("Boolean type of yes and no:", { yes: yes, no: no });
// Number and BigInteger
// ---------------------------------------------------------------------------------
var x;
var y = 0;
var z = 123.456;
// let big: bigint = 100n;
console.log({ y: y, z: z });
// String type
// ---------------------------------------------------------------------------------
var s;
var empty = "";
var abc = "abc";
console.log({ empty: empty, abc: abc });
// Enum type – Enumerations offer an easy way to work with sets of related constants
// ---------------------------------------------------------------------------------
var ContractStatus;
(function (ContractStatus) {
    ContractStatus[ContractStatus["Permanent"] = 0] = "Permanent";
    ContractStatus[ContractStatus["Temp"] = 1] = "Temp";
    ContractStatus[ContractStatus["Apprentice"] = 2] = "Apprentice";
})(ContractStatus || (ContractStatus = {}));
var employeeStatus = ContractStatus.Temp;
console.log({ employeeStatus: employeeStatus });
console.log(ContractStatus[employeeStatus]);
// Any Type - is the one type that can represent any JavaScript value with no constraints
// This can be useful when you're expecting a value from a third-party library
// or user inputs where the value is dynamic because the any type will allow you to reassign different types of values.
// ---------------------------------------------------------------------------------
var randomValue = 10;
randomValue = "Mateo";
randomValue = true;
console.log({ randomValue: randomValue });
// Unknown Type – is similar to the any type in that any value is assignable to type unknown.
// However, you can't access any properties of an unknown type, nor can you call or construct them.
// ---------------------------------------------------------------------------------
var randomValue2 = 10;
randomValue2 = true;
randomValue2 = "Meteo";
console.log(randomValue2.name);
console.log(randomValue2.toUpperCase());
// Type assertion
// ---------------------------------------------------------------------------------
var r = "Meto";
var result = "";
// This checking is called 'Type guard'
if (typeof r === "string") {
    result = r.toUpperCase();
}
else {
    result = "Error – A string was expected here.";
}
console.log({ result: result });
// Union types – A union type describes a value that can be one of several types
// This can be helpful when a value is not under your control (for example, values from a library, an API, or user input.)
// ---------------------------------------------------------------------------------
var m;
m = 20;
console.log({ m: m });
m = true;
console.log({ m: m });
m = "a string";
console.log({ m: m });
var myResult;
myResult = "incomplete"; //* Valid
myResult = "pass"; //* Valid
myResult = "failure"; //* Invalid
// Arrays
// ---------------------------------------------------------------------------------
var list = [1, 2, 3];
console.log({ list: list });
// Tuples
// ---------------------------------------------------------------------------------
var person = ["Marcia", 24];
console.log({ person: person });
// try adding another item to array
person.push(true);
var employee = {
    firstName: "Emil",
    lastName: "Andersson",
    fullName: function () {
        return this.firstName + " " + this.lastName;
    }
};
console.log(employee.firstName);
var myIceCream;
myIceCream = ["chocolate", "vanilla", "strawberry"];
var myStr = myIceCream[0];
console.log(myStr);
// Function
// ---------------------------------------------------------------------------------
// Named function
function addNumbers(x, y) {
    return x + y;
}
addNumbers(1, 2);
// Anonymous function
var addNumbers1 = function (x, y) {
    return x + y;
};
// Arrow function
var addNumbers2 = function (x, y) { return x + y; };
// Generic
// ---------------------------------------------------------------------------------
function getArray(items) {
    return new Array().concat(items);
}
var numberArray = getArray([5, 10, 15, 20]);
var stringArray = getArray(["Cats", "Dogs", "Birds"]);
numberArray.push(25); // OK
stringArray.push("Rabbits"); // OK
numberArray.push("This is not a number"); // OK
stringArray.push(30); // OK
console.log(numberArray);
console.log(stringArray);
var Car = /** @class */ (function () {
    function Car() {
        this.make = "Generic Car";
        this.doors = 4;
    }
    return Car;
}());
var ElectricCar = /** @class */ (function (_super) {
    __extends(ElectricCar, _super);
    function ElectricCar() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.make = "Electric Car";
        _this.doors = 4;
        return _this;
    }
    return ElectricCar;
}(Car));
var Truck = /** @class */ (function (_super) {
    __extends(Truck, _super);
    function Truck() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.make = "Truck";
        _this.doors = 2;
        return _this;
    }
    return Truck;
}(Car));
function accelerate(car) {
    var result = "All ".concat(car.doors, " doors are closed.");
    result += "The ".concat(car.make, " is now accelerating!");
    return result;
}
var myElectricCar = new ElectricCar();
result = accelerate(myElectricCar);
console.log(result);
var myTruck = new Truck();
result = accelerate(myTruck);
console.log(result);
