var webpage = require('webpage').create();
webpage.viewportSize = { width: 1280, height: 800 };
console.log(webpage.settings.userAgent)

webpage.onError = function(msg, trace) {
   console.error('On Error', msg);
}

webpage.onResourceRequested = function(req) {
   // console.log('xxxxxxxxxxxxxxxxxxxxxxxxxxxx');
   // console.log(JSON.stringify(req));
}

webpage.onResourceReceived = function(response) {
   // console.log('==============================')
   // console.log(JSON.stringify(response)) 
  // system.stderr.writeLine('= onResourceReceived()' ); 
  // system.stderr.writeLine('  id: ' + response.id + ', stage: "' + response.stage + '", response: ' + JSON.stringify(response));
};

// var site = 'http://www.google.co.th';
// var site = 'http://10.4.100.145:4000/afoss-main-bb.html';
var site = 'http://10.4.100.145:4000/afoss-main-bb.html?token=-r9kxwj2AsKjYmmsalQ2HWDxriUpJ0L2tG-uO1XMHMU';
webpage.open(site, function(status) {
   // console.log('args', arguments) 
   if(status == 'success'){
       console.log(status);
       var menu1 = webpage.evaluate(function(){
           var m1 = document.getElementById('menu1')
           return { x: m1.offsetLeft, y: m1.offsetTop }
       });

       setTimeout(function() {
           webpage.sendEvent('click', menu1.x + 1, menu1.y + 1);
           webpage.render('test.png');
           phantom.exit();
       }, 2000);
   } else {
       console.error(status);
       phantom.exit(1);
   }
});
