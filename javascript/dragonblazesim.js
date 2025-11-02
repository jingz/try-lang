var atk = 5500 + 3880, 
    asp = 61 + 48, 
    dep = 30.9,
    cr = 4.3 + 47.3, 
    cd = 41.7 + 99.9 + 51, 
    acc = 15.9 + 14.2;


var MON_DEF = 50.0, 
    MON_EVA = 30.0;


var def = (MON_DEF - dep) / 100.0;
def = def < 0 ? 0 : def;
console.log("MON DEF RATE: ", def);

var dmg = atk - (atk * def);
console.log("NORMAL ATK:", dmg.toFixed(2))

var cri = dmg + (dmg * cd/100.0)
console.log('MAX ATK:', cri.toFixed(2));

var avg_atk = (dmg * (100-cr)/100.0) + (cri * (cr/100.0))
console.log('AVG ATK:', avg_atk.toFixed(2));

var hit_rate = acc / MON_EVA; 
hit_rate = hit_rate >= 1 ? 1 : hit_rate;
console.log('HIT RATE:', hit_rate.toFixed(2));

var hit_per_sec = asp / 60.0
console.log('HIT PER SEC:', hit_per_sec.toFixed(2));

var dps = avg_atk * hit_per_sec * hit_rate;
console.log('DPS:', dps.toFixed(2))

var dps_per_min = dps * 60;
console.log('DPM:', dps_per_min.toFixed(2))
