// fibonacci

iter fibonacci(n: int){
  var(current, next) = (0,1);
  for 1..n{
    yield current;
    (current, next) = (next, current + next);
  }
}

writeln("The first few Fibonacci numbers are: ");
for indexVar in fibonacci(10) do
  write(indexVar, ", ");
writeln("...");
writeln();

writeln("Fibonacci Numbers");
for (i,j) in zip(1.., fibonacci(10)){
  write("The ", i);
  select i{
    when 1 do write("st");
    when 2 do write("nd");
    when 3 do write("rd");
    otherwise write("th");
  }
  writeln(" Fibonacci number is ", j);
}
writeln();

//multiloop
iter multiloop(n: int){
  for i in 1..n do
    for j in 1..n do
      yield (i, j);
}

writeln("Multiloop Tuples");
writeln(multiloop(3));
writeln();

// postorder
class Tree {
 var data: string;
 var left, right: owned Tree?;
}

iter postorder(tree: borrowed Tree?): borrowed Tree {
 if tree {
   if tree!.left{
     // Call the iterator recursively on the left subtree and expand.
     for child in postorder(tree!.left) do{
       yield child;
     }
   }
   if tree!.right{
     // Call the iterator recursively on the right subtree and expand.
     for child in postorder(tree!.right) do{
       yield child;
     }
   }
   // Finally, yield the node itself.
   yield tree!;
 }
}

var tree = new owned Tree("a",
  new owned Tree("b"),
  new owned Tree("c",
    new owned Tree("d"),
    new owned Tree("e")));

proc Tree.writeThis(x){
  var first = true;
  for node in postorder(this){
    if first then
      first = false;
    else
      x.write(" ");
    x.write(node.data);
  }
}

writeln("Tree Data");
writeln(tree);
writeln();

// Iterators in parallel

proc decorate(s:string) return "node_" + s;
writeln("Task parallel iteration");

coforall node in postorder(tree) do
  node.data = decorate(node.data);

writeln(tree);
writeln();
