//var number = "a":int;
var number = "1":int;

proc getSecondByte(arg:string) : int {
  var offsetInBytes = 2:byteIndex;
  return arg[offsetInBytes];
}

proc getSecondCodepoint(arg:string) : int {
  var offsetInCodepoints = 2:codepointIndex;
  return arg[offsetInCodepoints];
}

/*
var my_string = "Hello!";
on differnt_locale{
  print("%s", my_string.localize().c_str());
}
*/

var n = 3;
var str = "a ";
for 1..n {
  //writeln(str);
  str = str + "b ";
}
writeln(str);

//var x = "|".join("a","10","d");
//writeln(x); // prints: "a|10|d"
