program ExcEight;

const 
  BREAK = 0; 

procedure convertToBinary(n: integer);
begin 
  if(n <> BREAK) then begin 
    if(n < 2) then 
      write(n, ' | ')
    else begin 
      convertToBinary(n div 2);
      write((n mod 2), ' | ');
    end;
  end;
end; 

var 
  number: integer; 
begin 
  number:= 1; 
  while(number <> BREAK) do begin 
    writeln('Insert a decimal number to be converted to binary');
    readln(number);
    convertToBinary(number);
    writeln('');
  end;
end. 
