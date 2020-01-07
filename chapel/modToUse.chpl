module modToUse{
  var foo = 12;
  var bar: int = 2;
  private var hiddenFoo = false;
  proc baz (x,y){
    return x * ( x + y );
  }
  private proc hiddenBaz(a){
    writeln(a);
    return a + 3;
  }
  record Rec{
    var field: int;
    proc method1(){
      write("In Rec.method1()");
    }
  }
  proc Rec.method2(){
    writeln("In Rec.method2()");
  }
}

module AnotherModule{
  var a = false;
}

module ThirdModule{
  var b = -13.0;
}

module Conflict{
  var bar = 5;
  var other = 5.0 + 3i;
  var another = false;
}

module DifferentArguments{
  proc baz(x){
    return x - 2;
  }
}

module MainModule{
  proc main(){
    writeln("Access from outside a module");
    use modToUse, DifferentArguments;

    writeln(baz(2, 3));
    // Accesses the function modToUse.baz using the two arguments.  Should
    // output 2 * (2 + 3) or '10'
    writeln(baz(3));
    // Access the function DifferentArguments.baz using the single argument.
    // Should output 3 - 2, or '1'
  }
}
