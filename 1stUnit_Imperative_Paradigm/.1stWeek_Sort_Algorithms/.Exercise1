program excOne;
const
  PHYDIM= 300; //physical dimension of the array 
  BREAK = -1;
type 
  office = record 
    cod:integer;
    id:integer;
    expenses:real; 
   end;

   officesVector = array[0..PHYDIM - 1] of office;

procedure readOffice(var off:office);
begin
  writeln('Insert identification code: ');
  read(off.cod);
  if(off.cod <> BREAK) then begin
    writeln('Insert the proprietor´s identification: ');
    readln(off.id);
    writeln('Insert the value of expenses: ');
    readln(off.expenses);
  end;
end;

procedure generateVector(var ov:officesVector; var lDim:integer); //lDim = logical dimension of the array 
var 
    off: office;
begin
    lDim:=0;
    readOffice(off);
    while (off.cod<>BREAK) and (lDim<PHYDIM) do begin 
        ov[lDim]:= off;
        lDim:= lDim + 1;
        readOffice(off);
     end;
end; 

procedure sortVector(var ov:officesVector; lDim:integer);
var
  actual:office; 
  i, j:integer;
begin
  for i:= 2 to lDim do begin 
    actual:=ov[i];
    j:=i-1;
    while (j > 0) and (ov[j].cod > actual.cod) do begin 
      ov[j+1]:=ov[j];
      j:=j-1;
    end;
  ov[j+1]:=actual; 
  end;
end;

procedure printVector(ov: officesVector; lDim: integer);
var
    i: integer;
begin 
    for i:=0 to lDim do 
        writeln('CODE: ', ov[i].cod, ' | ', 'ID: ', ov[i].id, ' | ', 'Expenses: ', ov[i].expenses:0:2);
end;

var 
    OV:officesVector;
    lDim:integer;
begin
    generateVector(OV,lDim);
    writeln('The elements of the unsorted vector are: ');
    printVector(OV, lDim);
    readln();
    sortVector(OV, lDim);
    writeln('The elements of the sorted vector are: ');
    printVector(OV, lDim);
    readln();
end.
