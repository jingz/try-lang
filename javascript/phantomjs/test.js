console.log('This is phantomjs');

if(phantom.args.length === 0){
    console.log('There is no any args!')
} else {
    console.log('Args are', phantom.args);
}

phantom.exit();
