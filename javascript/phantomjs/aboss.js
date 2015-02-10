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

// var site = 'http://10.4.100.145:4000/afoss-main-bb.html';
var site = 'http://localhost:3000/aboss-ui/auth/AUTH001/index.html';

var mainsite = 'http://localhost:3000/aboss-ui/index.html';
webpage.open(site, function(status) {
   if(status == 'success'){
       var loginBtnPos = webpage.evaluate(function(){
            document.querySelector('input[name=username]').value = 'xadmin';
            document.querySelector('input[name=password]').value = 'q1W@e3r4';
            var loginBtn = document.querySelector('button');
            return Util.cumulativeOffset(loginBtn);
       });

       webpage.sendEvent('click', loginBtnPos.left + 1, loginBtnPos.top + 1);
       setTimeout(function() {
           webpage.render('ABOSS.png');
           webpage.evaluate(function(){ document.location.hash = '#CACC002'; });
           // capture CACC002
           setTimeout(function() {
               webpage.render('CACC002.png');
               var n = webpage.evaluate(function(){
                    var btn = _.find(document.querySelectorAll('button'), function(b){
                        return b.textContent == 'New Account';
                    });
                    return Util.cumulativeOffset(btn);
               });
               webpage.sendEvent('click', n.left + 1, n.top + 1);

               setTimeout(function(){
                    webpage.render('CACC002#NEW_ACCOUNT.png') 
                    phantom.exit();
               }, 1000);

           }, 3000);
       }, 2000);

   } else {

       console.error(status);
       phantom.exit(1);
   }
});
