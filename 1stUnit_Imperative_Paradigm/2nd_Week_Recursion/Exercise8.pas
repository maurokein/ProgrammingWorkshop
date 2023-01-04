program ExcEight; 
const 
  BREAK = 0; 
type 
  tree = ^node;
  node = record 
    data: integer; 
    LC: tree; 
    RC: tree; 
  end; 
  
procedure readInteger(var i: integer);
begin 
  writeln('Insert an integer number');
  readln(i);
end; 

procedure insertInteger(var t: tree; value: integer);
begin 
  if(t = nil) then begin 
    new(t);
    t^.data:= value; 
    t^.LC:= nil;
    t^.RC:= nil;
  end 
  else begin 
    if(value < t^.data) then 
      insertInteger(t^.LC, value)
    else 
      insertInteger(t^.RC, value);
  end;
end;

procedure loadBinarySearchTree(var t: tree);
var 
  int: integer; 
begin   
  t:= nil;
  readInteger(int);
  while(int <> BREAK) do begin 
    insertInteger(t, int);
    readInteger(int);
  end; 
end; 

procedure greatestNumber(t: tree; var number: integer);
var 
  previous: tree;
begin 
  while(t <> nil) do begin 
    previous:= t;
    t:= t^.RC;
  end; 
  number:= previous^.data; 
end; 

procedure lowestNumber(t: tree; var number: integer);
var 
  previous: tree;
begin
  while(t <> nil) do begin 
    previous:= t;
    t:= t^.LC;
  end;
  number:= previous^.data;
end; 

procedure numberOfElements(t: tree; var total: integer);
begin 
  if(t <> nil) then begin 
    numberOfElements(t^.LC, total);
    total:= total + 1; 
    numberOfElements(t^.RC, total);
  end; 
end; 

function numberOfElements2(t: tree): integer;
begin 
  if(t = nil) then 
    numberOfElements2:= 0
  else 
    numberOfElements2:= 1 + numberOfElements2(t^.LC, total) + numberOfElements2(t^.RC, total);
end; 

procedure reportInOrder(t: tree);
begin 
  if(t <> nil) then begin 
    reportInOrder(t^.LC);
    write(t^.data, ' | ');
    reportInOrder(t^.RC);
  end;
end; 

procedure reportEvenNumbersInDecreasingOrder(t: tree);
begin 
  if(t <> nil) then begin 
    reportEvenNumbersInDecreasingOrder(t^.RC);
    if((t^.data mod 2) = 0) then 
      write(t^.data, ' | ');
    reportEvenNumbersInDecreasingOrder(t^.LC);
  end;
end; 

var 
  t: tree; 
  total: integer; 
  min, max: integer; 
begin 
  total:= 0;
  loadBinarySearchTree(t);
  writeln('');
  reportInOrder(t);
  writeln('');
  numberOfElements(t, total);
  writeln('The number of elements inside the tree according to the procedure is: ', total);
  writeln('');
  writeln('The number of elements inside the tree according to the function is: ', numberOfElements2(t));
  writeln('');
  lowestNumber(t, min);
  writeln('The lowest number of the tree is: ', min);
  writeln('');
  greatestNumber(t, max);
  writeln('The greatest number of the tree is: ', max);
  writeln('');
  reportEvenNumbersInDecreasingOrder(t);
  end.
