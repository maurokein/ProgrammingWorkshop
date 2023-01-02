program ExcFive; 
const
  PHY_DIM = 20; //physical dimension of the array 
type 
  vector = array[1.. PHY_DIM] of integer;
 
procedure createVector(var v: vector);
var 
  i: integer; 
begin 
  for i:= 0 to PHY_DIM -1 do 
    v[i]:= random(100);
end; 

procedure maximumValue(v: vector; pos: integer; var max: integer);
begin 
  if(pos <= PHY_DIM) then begin 
    if(v[pos] > max) then
      max:= v[pos];
    maximumValue(v, pos + 1, max);
  end;
end; 

function maximumValue2(v: vector; pos: integer; max: integer): integer;
begin 
  if(pos = PHY_DIM) then 
    maximumValue2:= max
  else begin 
    if(v[pos] > max) then
      max:= v[pos];
    maximumValue2:= maximumValue2(v, pos + 1, max);
  end;
end; 

procedure sumOfValues(v: vector; pos: integer; var sum: integer);
begin 
  if(pos < PHY_DIM) then begin 
    sum:= sum + v[pos];
    sumOfValues(v, pos + 1, sum);
  end;
end;

function sumOfValues2(v: vector; pos: integer; sum: integer): integer;
begin 
  if(pos = PHY_DIM) then
    sumOfValues2:= sum
  else begin
    sum:= sum + v[pos];
    sumOfValues2:= sumOfValues2(v, pos + 1, sum);
  end; 
end; 

procedure displayVector(v: vector);
var 
  i: integer;
begin 
  writeln('The vector contains the following elements: ');
  for i:= 0 to PHY_DIM - 1 do 
    write(v[i], ' | ');
end; 

var 
  IV: vector; 
  pos, max, sum: integer; 
begin 
  Randomize;
  pos:= 0; 
  max:= -1; 
  sum:= 0;
  createVector(IV); 
  writeln('');
  displayVector(IV);
  writeln('');
  maximumValue(IV, pos, max);
  writeln('');
  writeln('The maximum value into the array according to the procedure is: ', max);
  writeln('');
  writeln('The maximum value into the array according to the function is: ', maximumValue2(IV, poss, max));
  sumOfValues(IV, pos, sum);
  writeln('The sum of all the values of the array according to the procedure is: ', sum);
  writeln('');
  sum:= 0;
  writeln('The sum of all the values of the array according to the function is: ', sumOfValues2(IV, pos, sum));
end. 
