function arraySum(list) {
    var sum = 0;
    for(var i = 0; i < list.length; i++){
        if( list[i] % 1 == 0 ){
            sum += list[i];
        } 
        if( list[i] instanceof Array ){
            sum += arguments.callee(list[i].slice(0));
        }
    }
    return sum;
}

console.log(arraySum([[1,2,3],4,5]));  //=> 15
console.log(arraySum([4,5,[1,2,3]]));  //=> 15
