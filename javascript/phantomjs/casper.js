var casper = require('casper').create();
var site = 'http://10.4.100.145:4000/afoss-main-bb.html?token=-r9kxwj2AsKjYmmsalQ2HWDxriUpJ0L2tG-uO1XMHMU';

casper.start(site, function(){
    this.click('#menu1');
});

casper.then(function() {
    this.echo('Testing With CasperJS');
    this.echo(this.getHTML('#menu1'));
});

casper.run();
