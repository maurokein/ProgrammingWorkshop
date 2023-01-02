program ExcFour; 
const 
  BREAK = 0; 
type 
  list = ^node; 
  node = record 
    data: integer; 
    next: list;
  end; 
  
procedure readNumber(var n: integer);
begin 
  writeln('Insert an integer number');
  readln(n);
end; 

procedure addInteger(var l: list; num: integer);
var 
  n: list; 
begin 
  new(n);
  n^.data:= num;
  n^.next:= l;
  l:= n; 
end; 

procedure createList(var l: list);
var 
  num: integer;
begin 
  readNumber(num);
  while(num <> BREAK) do begin
    addInteger(l, num);
    readNumber(num);
  end;
end; 

procedure minimumValue(l: list; var min: integer);
begin 
  if(l <> nil) then begin 
    	if(l^.data < min) then 
        min:= l^.data;
      minimumValue(l^.next, min);
  end; 
end; 

function minimumValue2(l: list; min: integer): integer;
begin 
  if(l = nil) then 
    minimumValue2:= min
  else begin 
    if(l^.data < min) then begin 
      min:= l^.data; 
      minimumValue2:= minimumValue2(l^.next, min);
    end;
  end;
end; 

procedure maximumValue(l: list; var max: integer);
begin 
  if(l <> nil) then begin 
    if(l^.data > max) then 
      max:= l^.data; 
    maximumValue(l^.next, max);
  end;
end; 

function maximumValue2(l: list; max: integer): integer; 
begin
  if(l = nil) then 
    maximumValue2:= max
  else begin 
    if(l^.data > max) then begin 
      max:= l^.data;
      maximumValue2:= maximumValue2(l^.next, max);
    end;
  end;
end; 
  
procedure exists(l: list; v: integer; var e: boolean);
begin 
  if(l <> nil) then begin 
    if(l^.data <> v) then begin 
      e:= false; 
      exists(l^.next, v, e);
    end
    else 
      e:= true;
  end;
end; 

function exists2(l: list; v: integer; e: boolean): boolean; 
begin 
  if(l = nil) then 
    exists2:= e
  else begin 
    if(l^.data <> v) then begin 
      e:= false; 
      exists2:= exists2(l^.next, v, e); 
    end
    else 
      exists2:= true;
  end;
end; 

procedure displayList(l: list);
begin 
  writeln('The data inside the list are the following numbers: ');
  writeln('');
  while(l <> nil) do begin 
    write(l^.data, ' | ');
    l:= l^.next;
  end;
end; 

var 
  IL: list; 
  min, max, value: integer; 
  itWasFound: boolean; 
begin 
  IL:= nil;
  min:= 9999;
  max:= -1; 
  createList(IL);
  displayList(IL);
  minimumValue(IL, min);
  writeln('');
  writeln('The minimun value found in the list is: ', min);
  maximumValue(IL, max);
  writeln('');
  writeln('The maximum value found in the list is: ', max);
  writeln('');
  writeln('Insert the integer number that wishes to find'); 
  readln(value);
  exists(IL, value, itWasFound);
  if(itWasFound) then 
    writeln('The value was found in the list')
  else 
    writeln('The value was not found in the list');
  writeln('');
  if(exists2(IL, value, itWasFound)) then 
    writeln('Value exists')
  else 
    writeln('Value does not exist');
  readln();
end. 
