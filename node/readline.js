var readline = require('readline');
var rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Yo wassup this question from playing readline: ", function(ans){
    console.log("WO! this is in the answer function that receive: ", ans);
    rl.close();
});
