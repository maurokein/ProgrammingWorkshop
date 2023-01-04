program ExcNine;
const 
  BREAK = 'ZZZ';
type 
  tree = ^node;
  node = record 
    data: string; 
    LC: tree;
    RC: tree; 
  end; 

procedure readName(var n: string);
begin 
  writeln('Insert the name');
  readln(n);
end; 

procedure insertName(var t: tree; n: string);
begin 
  if(t = nil) then begin 
    new(t);
    t^.data:= n;
    t^.LC:= nil;
    t^.RC:= nil;
  end
  else begin 
    if(n < t^.data) then 
      insertName(t^.LC, n)
    else 
      insertName(t^.RC, n);
  end;
end;

procedure createTree(var t: tree);
var 
  n: string;
begin 
  readName(n);
  while(n <> BREAK) do begin 
    insertName(t, n);
    readName(n);
  end;
end; 

procedure searchName1(t: tree; n: string; var ok: boolean);
begin
  if(t <> nil) then begin 
    if(t^.data <> n) then begin 
      ok:= false;
      if(n < t^.data) then
        searchName1(t^.LC, n, ok)
      else 
        searchName1(t^.RC, n, ok);
    end
    else 
      ok:= true;
  end;
end; 

function searchName2(t: tree; n: string): boolean;
begin
  if(t = nil) then 
    searchName2:= false
  else begin 
    if(t^.data = n) then 
      searchName2:= true
    else begin 
      if(t^.data < n) then 
        searchName2:= searchName2(t^.LC, n)
      else 
        searchName2:= searchName2(t^.RC, n);
    end;
  end;
end;

procedure numberOfElements(t: tree; var total: integer);
begin 
  if(t <> nil) then begin 
    numberOfElements(t^.LC, total);
    total:= total + 1; 
    numberOfElements(t^.RC, total);
  end;
end; 

procedure reportInOrder(t: tree);
begin 
  if(t <> nil) then begin 
    reportInOrder(t^.LC);
    write(t^.data, ' | ');
    reportInOrder(t^.RC);
  end; 
end; 

var 
  t: tree; 
  searchedName: string; 
  total: integer; 
  exists: boolean; 
begin 
  t:= nil; 
  total:= 0; 
  createTree(t);
  numberOfElements(t, total);
  writeln('The tree contains the following number of names: ', total);
  writeln('');
  writeln('Saves names into the tree are: ');
  reportInOrder(t);
  writeln('');
  writeln('Insert the name that wishes to search');
  readln(searchedName);
  if(searchName2(t, searchedName)) then 
    writeln('According to the function the name exists in the tree')
  else 
    writeln('According to the function the name does not exist in the tree');
  writeln('');
  searchName1(t, searchedName, exists);
  if(exists) then 
    writeln('According to the procedure the name exists in the tree')
  else 
    writeln('According to the procedure the name does not exist in the tree');
  readln;
end.
