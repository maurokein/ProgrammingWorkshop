program ExcSix; 
const 
  PHY_DIM = 20; 
type 
  vector = array[1..PHY_DIM] of integer; 
  
procedure binarySearch(v: vector; init_pos, final_pos, value: integer; var pos: integer);
var 
  half: integer; 
begin 
  if(init_pos <= final_pos) then begin 
    half:= init_pos + final_pos div 2;
    if(v[half] = value) then 
      pos:= half
    else begin 
      if(value < v[half]) then 
        binarySearch(v, init_pos, half - 1, value, pos)
      else 
        binarySearch(v, half + 1, final_pos, value, pos);
    end; 
  end
  else
    pos:= -1;
end; 

procedure createVector(var v: vector);
var 
  i: integer; 
begin 
  for i:= 1 to PHY_DIM do 
    v[i]:= random(100);
end; 

procedure sortVector(var v: vector);
var 
  i, j: integer;
  current: integer; 
begin 
  for i:= 2 to PHY_DIM do begin 
    current:= v[i];
    j:= i-1; 
    while(j > 0) and (v[j] > current) do begin 
      v[j+1]:= v[j];
      j:= j-1; 
    end;
    v[j+1]:= current;
  end;
end;
  
procedure maximumValue(v: vector; pos: integer; var max: integer);
begin 
  if(pos <= PHY_DIM) then begin 
    if(v[pos] > max) then 
      max:= v[pos];
    maximumValue(v, pos + 1, max);
  end;
end; 

procedure sumOfValues(v: vector; pos: integer; var sum: integer);
begin 
  if(pos <= PHY_DIM) then begin 
    sum:= sum + v[pos];
    sumOfValues(v, pos + 1, sum);
  end; 
end; 

procedure displayVector(v: vector);
var 
  i: integer;
begin 
  for i:= 1 to PHY_DIM do
    write(v[i], ' | ');
end; 

var 
  IV: vector;
  pos1, max, sum: integer; 
  pos2, init_pos, final_pos: integer; 
  value: integer;
begin 
  Randomize; 
  pos1:= 1;
  max:= -1; 
  sum:= 0; 
  init_pos:= 1; 
  final_pos:= PHY_DIM; 
  createVector(IV);
  displayVector(IV);
  maximumValue(IV, pos1, max);
  writeln('');
  writeln('The maximum value in the array is: ', max);
  sumOfValues(IV, pos1, sum);
  writeln('');
  writeln('The result of the sum of values is: ', sum);
  sortVector(IV);
  writeln('');
  displayVector(IV);
  writeln('');
  writeln('Insert the value that wishes to search');
  readln(value);
  binarySearch(IV, init_pos, final_pos, value, pos2);
  if(pos2 = -1) then 
    writeln('The value was not found into the array')
  else 
    writeln('The value was found at the position: ', pos2, ' of the array');
  readln();
end.
