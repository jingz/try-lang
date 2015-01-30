var i = 1;
console.log(i, typeof i);  //=> 1 'number'

var s = "Ape";
console.log(s, typeof s);  //=> Ape string

var b = true;
console.log(b, typeof b);  //=> true 'boolean'

var fn = function(){}
console.log(fn, typeof fn);  //=> [Function] 'function'

var fl = 1.99;
console.log(fl, typeof fl);  //=> 1.99 'number'

console.log(i + s);  //=> 1Ape
console.log(i + b);  //=> 2
console.log(true + true);  //=> 2
console.log(i + fn);  //=> 1function (){}
console.log(i * fn);  //=> NaN
console.log(i / fn);  //=> NaN
console.log(i + fl);  //=> 2.99
