// Play Date
// mozila doc
/*
 * Constructor
 * new Date();
 * new Date(value); # value -> integer representing the number of millisecond since 1 JAN 1960 UTC
 * new Date(dateString); # recognized by Date.parse() method
 * new Date(year, month, day, hour, min, sec, milisec); # all are integer ** month beginning with 0
 *
 */
// create data from string example "2015-01-15"

str = "2015-01-15";
console.log(Date.parse(str))
console.log(new Date(Date.parse(str)))

str = "2015-02-04 10:59";
console.log(Date.parse(str))
console.log(new Date(Date.parse(str)))

// iso date string format
str = "2015-02-04T10:59:40";
console.log(Date.parse(str))
console.log(new Date(Date.parse(str)))

str = "20 Jan 2015"; // RFC 2822
console.log(Date.parse(str))
console.log(new Date(Date.parse(str)))

// wrong format it will return NaN
str = "20 Mon Jan 2015";
console.log(Date.parse(str))

// create from number
console.log(new Date(2015, 0, 21, 15, 10, 33))

// today
console.log(Date())

// convert date to string
d = new Date();
console.log(d)
console.log(d.getFullYear())
console.log(d.getMonth())
console.log(d.getDate())
console.log(d.getHours())
console.log(d.getMinutes())
console.log(d.getSeconds())
console.log(d.getMilliseconds())
console.log(d.getUTCDate())

console.log(d.getTime())
