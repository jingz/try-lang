var fs = require('fs'),
    filenames,
    i,
    processId;

filenames = fs.readdirSync(".");
console.log("Readfile Synch")
for (i = 0; i < filenames.length; i++) {
    console.log(filenames[i]);
}

processId = process.getuid();
console.log("Process ID:", processId);

fs.readdir(".", function  (err, fnames) {
    console.log("Print file async")
    for (var i = 0; i < filenames.length; i++) {
        console.log(filenames[i]);
    };
    console.log("Ready.");
});

processId = process.getuid();
console.log("Process ID (async):", processId);

