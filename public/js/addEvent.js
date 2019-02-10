var dt   = new Date();
var day  = ("0"+dt.getDay()).slice(-2);
var mnth = ("0"+(dt.getMonth()+1)).slice(-2);
var year = dt.getFullYear();
var hour = ("0"+dt.getHours()).slice(-2);
var mins  = ("0"+dt.getMinutes()).slice(-2);

document.getElementById('time').innerHTML=day+"-"+mnth+"-"+year+" "+hour+":"+mins;