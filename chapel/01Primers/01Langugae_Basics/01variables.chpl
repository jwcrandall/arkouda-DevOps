var myVariable1: int;
writeln("myVariable1 = ", myVariable1);

var myVariable2 = 1.618;
writeln("myVariable2 = ", myVariable2, " (type = ", myVariable2.type:string, ")");

type myType = uint(16);
var myVariable3: myType = 3;
writeln("myType = ", myType:string);
writeln("myVariable3 = ", myVariable3, " (type = ", myVariable3.type:string, ")");

const myConst: real = sqrt(myVariable2);
param myParam = 3.14;
writeln("myConst = ", myConst, ", myParam = ", myParam);

config var cfgVar = "hello";          // ./variables --cfgVar="world"
config const cfgConst: bool = false;  // ./variables --cfgConst=true
config param cfgParam = 4;            // chpl variables.chpl -s cfgParam = 1
config type cfgType = complex;        // chpl variables.chpl -s cfgType=imag
writeln("cfgVar = ", cfgVar,
        ", cfgConst = ", cfgConst,
        ", cfgParam = ", cfgParam,
        ", cfgType =", cfgType:string);

var a = 1.0, b, c: int, d, e = 1.0, f: real;
writeln("a = ", a, ", b = ", b, ", c = ", c,
        ", d = ", d, ", e = ", e, ", f = ", f);
