//Arrays

config const n = 5;
var A: [1..n] real;
writeln("Initially, A is: ", A);
var A2 = [-1.1, -2.2, -3.3, -4.4, -5.5];
writeln("Initially, A2 is: ", A2);
A[1] = 1.1;
A(2) = 2.2;
writeln("After assigning two elements, A is: ", A);

A[2..4] = 3.3;
writeln("After assigning its interior values, A is: ", A);

writeln("A2[2] =  ", A2[2]);

writeln("A(2..4) is: ", A(2..4),"\n");

//multidimensional
var B: [1..n, 1..n] real;

forall (i,j) in {1..n,1..n} do
  B(i,j)=i + j/10.0;

writeln("Initially, B is :\n", B, "\n");

forall b in B do
  b += 1;

writeln("After incrementing B's elements, B is :\n", B, "\n");

printArr(B);

proc printArr(X: [?D] real) {
  writeln("within printArr, D is: ", D, "\n");
  forall(i,j) in D do
    X(i,j) = -X(i,j);
  writeln("after negating X within printArr, X is :\n", X, "\n");
}

writeln("After calling printArr, B is :\n", B, "\n");

//2D rectangular domain
var ProbSpace: domain(2) = {1..n,1..n};
var C, D, E: [ProbSpace] bool;
for (i,j) in ProbSpace do
  C(i,j) = (i+j) % 3 == 0;
writeln("After initializing C, its value is :\n", C, "\n");

for ij in ProbSpace do
  D(ij) = ij(1) == ij(2);

writeln("After initializing D, its value is :\n", D, "\n");

E = C;
writeln("After assinging C to E, E's value is :\n", E, "\n");

B = 0.0;
writeln("After being reset, B is :\n", B, "\n");

for (i,j) in ProbSpace do
  B(i,j) = i + j/10.0;
writeln("B has been re-initialized to :\n", B, "\n");

var F, G: [ProbSpace] real;
F[2..n-1, 2..n-1] = B[1..n-2, 3..n];

writeln("After assigning a slice of B to F, F's value is :\n", F, "\n");

G[2.., ..] =  B[..n-1, ..];
writeln("After assigning a slice of B to G, G's value is :\n", G, "\n");

A = B[n/2, ..];
writeln("After being assigned a slice of B, A is :\n", A, "\n");

writeln("ProbSpace[1..n-2, 3..] is: ", ProbSpace[1..n-2, 3..], "\n");

const ProbSpaceSlice = ProbSpace[0..n+1, 3..];
writeln("B[ProbSpaceSlice] is:\n", B[ProbSpaceSlice], "\n");

const offset = (1,1); // a 2-tuple offset
[ij in ProbSpace[2..n-1,2..n-1]] F(ij) = B(ij + offset);
writeln("After assigning F a shifted slice of B, it is :\n", F, "\n");
[b in B] b = -b;
writeln("After negating B, it is :\n", B, "\n");

var VarDom = {1..n};
var VarArr: [VarDom] real = [i in VarDom] i;
writeln("Initially, VarArr = ", VarArr, "\n");

VarDom = {1..2*n};
writeln("After doubling VarDom, VarArr = ", VarArr, "\n");

VarDom = {-n+1..2*n};
writeln("After lowering VarDom's lower bound, VarArr = ", VarArr, "\n");

VarDom = {2..n-1};
writeln("After shrinking VarDom, VarArr = ", VarArr, "\n");

VarDom = {1..0};
writeln("VarArr should now be empty: ", VarArr, "\n");
VarDom = {1..n};
writeln("VarArr should now be reset: ", VarArr, "\n");

var Y: [ProbSpace][1..3] real;
forall(i,j) in ProbSpace do
  for k in 1..3 do
    Y(i,j)(k) = i*10 + j + k/10.0;

writeln("Y is :\n", Y);
