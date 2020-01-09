//Provedures

proc factorial(x: int) : int {
  if x < 0 then
    halt("factorial -- Sorry, this is not the gamma procedure!");
  return if x == 0 then 1 else x * factorial(x-1);
}

writeln("A simple procedure");
writeln("6! is ", factorial(6));
writeln();

//Overloading Functions

proc factorial(x: int(32)) : int(32) {
  if x < 1 then
    halt("factorial -- Invalid operand.");
  if x < 3 then return x;
  return x * (x-1) * factorial(x-2);
}

writeln("Another simple procedure");
writeln("33! is ", factorial(33));

writeln("6! is ", factorial(6:int(32)));
writeln();

//Overloading Operators

record Point { var x, y: real; }
proc +(p1: Point, p2: Point){
  //Vector addition in 2-space.
  return new Point(p1.x + p2.x, p1.y + p2.y);
}

proc Point.writeThis(w){
  // Writes it out as a coordinate pair.
  w.write("(");
  w.write(this.x);
  w.write(", ");
  w.write(this.y);
  w.write(")");
}

writeln("Using operator overloading");
var down = new Point(10.0, 0.0);
var over = new Point(0.0, -5.0);
writeln("down + over = ", down + over);
writeln();

//Details on Arguments

class Circle {
  var center : Point;
  var radius : real;
}

proc create_circle(x = 0.0, y = 0.0, diameter = 0.0){
  var result = new owned Circle ();

  result.radius = diameter / 2;
  result.center.x = x;
  result.center.y = y;

  return result;
}

writeln("Using named arguments");

var c = create_circle(diameter=3.0,2.0);
writeln(c);
writeln();

proc unknownArg(x){
  writeln(x);
  if x.type == int then
    writeln("I see you've passed me an integer!");
  else if x.type == string {
    writeln("I liked that last variable so much, I'll wirte it again!");
    writeln(x);
  }
}

var intArg = 5;
var strArg = "Greetings, procedure unknownArg!";
var boolArg = false;
writeln("Using generic arguments");
unknownArg(intArg);
unknownArg(strArg);
unknownArg(boolArg);
writeln();

//Argument Intents

config param useSleep = true; // Set at compile time, use to speed up testing
use Time;

proc countDown(in n: uint = 10) : void {
  while n > 0{
    writeln(n, "...");
    if useSleep then sleep(1);
    n -= 1;
  }
  writeln("Blastoff!");
}

writeln("Using the \"in\" intent");
var s = 5 : uint;
countDown(s);
writeln("s is still ", s); // 5
writeln();

proc countDownToZero(inout n : uint = 10) : void{
  while n > 0{
    writeln(n, " ...");
    if useSleep then sleep(1);
    n -= 1;
  }
  writeln("Boink?");
}

writeln("Using the \"inout\" intent");
var t = 3 : uint;
countDownToZero(t);
writeln("t is now ", t); //0
writeln();

proc countDownToZeroToo(ref n : uint = 10) : void {
  while n > 0 {
    writeln(n, " ...");
    if useSleep then sleep(1);
    n -= 1;
  }
  write("Flippity boop");
}

writeln("Using the \"ref\" intent");
var bip = 3 : uint;
countDownToZeroToo(bip);
writeln("bip is now ", bip);   //0
writeln();

proc atan(x : real, out result : real){
  result = 0.0;
  var count = 0;
  var lastresult = 0.0;
  for i in 1.. by 2{
    var twoIP1 = 2 * count + 1;
    var term = x ** twoIP1 / twoIP1;
    result += if count % 2 == 0 then term else - term;
    count += 1;
    if abs(result - lastresult) < 1.0e-3 then break;
    lastresult = result;
  }
  return count;
}

writeln("Using the \"out\" intent");
var theta : real;
var n = atan (1.0, theta);
writeln("Computed Pi as about ", 4.0 * theta, " in ", n, " iterations.");
writeln();

proc writeList(x ...?k){
  var first = true;
  for param i in 1..k {
    if first then first = false; else write(" ");
    write(x(i));
  }
  writeln();
}

writeln("Using variable argument list.");
writeList(1, "red", 8.72, 1..4);
writeln();
