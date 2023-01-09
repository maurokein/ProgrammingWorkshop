program ExcTwelwe;
const 
  BREAK = 0; 
  BRANCH_QUA = 4;
  MAX_VALUE = MAXINT;
type
  branches = 1..BRANCH_QUA;
  
  sale = record 
    date: string;
    prodCode: integer;
    branchCode: integer;
    sales: integer;
  end; 
  
  list = ^node; 
  node = record 
    data: sale;
    next: list;
  end; 
  
  stringVector = array[branches] of string[20];
  branchVector = array[branches] of list;
  
  accumulatedSales = record 
    prodCode: integer; //sort field 
    totalSales: integer;
  end; 
  
  accumulatingList = ^nodeA;
  nodeA = record
    data: accumulatedSales;
    next: accumulatingList;
  end; 
  
procedure loadStringVector(var sv: stringVector);
var 
  i: integer;
begin
  for i:= 1 to BRANCH_QUA do begin 
    writeln('Insert branch', i);
    readln(sv[i]);
  end;
end; 

procedure initializeVector(var bv: branchVector);
var 
  i: integer;
begin 
  for i:= 1 to BRANCH_QUA do 
    bv[i]:= nil;
end;

procedure insertSorted(var l: list; s: sale);
var 
  n, act, prv: list;
begin 
  new(n);
  n^.data:= s;
  act:= l;
  prv:= l;
  while(act <> nil) do begin 
    prv:= act;
    act:= act^.next;
  end; 
  if (prv = act) then 
    l:= n
  else 
    prv^.next:= n;
  n^.next:= act;
end; 

procedure readSale(var s: sale);
begin 
  writeln('Enter branch code');
  readln(s.branchCode);
  if(s.branchCode <> BREAK) then begin 
    writeln('Enter product code');
    readln(s.prodCode);
    writeln('Enter date of sale');
    readln(s.date);
    writeln('Enter the quantity sold ');
    readln(s.sales);
  end;
end;

procedure loadVector(var bv: branchVector);
var 
  s: sale;
begin 
  readSale(s);
  while(s.branchCode <> BREAK) do begin 
    insertSorted(bv[s.branchCode], s);
    readSale(s);
  end;
end; 
    
procedure printVector(bv: branchVector; sv: stringVector);
var 
  i: integer;
begin 
  for i:= 1 to BRANCH_QUA do begin 
    writeln('Following codes correspond to: ', sv[i]);
    while(bv[i] <> nil) do begin 
      writeln('{Product Code: ', bv[i]^.data.prodCode);
      writeln('Date of sale: ', bv[i]^.data.date);
      writeln('Quantity sold: ', bv[i]^.data.sales, '}');
      bv[i]:= bv[i]^.next;
    end;
  end;
end; 

procedure addAtLast(var first, last: accumulatingList; data: accumulatedSales);
var 
  n: accumulatingList;
begin 
  new(n);
  n^.data:= data;
  n^.next:= nil;
  if(first = nil) then 
    last^.next:= n
  else 
    first:= n;
  last:= n;
end; 

procedure selectMinimum(var bv: branchVector; var min: sale);
var 
  i, minPos: integer;
begin 
  min.prodCode:= MAX_VALUE; 
  for i:= 1 to BRANCH_QUA do begin 
    if(bv[i] <> nil) and (bv[i]^.data.prodCode < min.prodCode) then begin 
      min:= bv[i]^.data;
      minPos:= i;
    end;
  end;
  if(min.prodCode <> MAX_VALUE) then 
    bv[minPos]:= bv[minPos]^.next;
end; 

procedure accumulatingMerge(bv: branchVector; var al: accumulatingList);
var 
  min: sale;
  last: accumulatingList;
  actual: accumulatedSales;
begin 
  al:= nil;
  last:= nil;
  selectMinimum(bv, min);
  while(min.prodCode <> MAX_VALUE) do begin 
    actual.prodCode:= min.prodCode;
    actual.totalSales:= 0;
    while(actual.prodCode = min.prodCode) do begin 
      actual.totalSales:= actual.totalSales + min.sales;
      selectMinimum(bv, min);
    end;
    addAtLast(al, last, actual);
  end; 
end; 

procedure displayAccumulatedData(data: accumulatedSales);
begin 
  writeln(' Product Code: ', data.prodCode, ' Total Sales: ', data.totalSales);
end; 

procedure printAccumulatingList(al: accumulatingList);
begin 
  while(al <> nil) do begin 
    displayAccumulatedData(al^.data);
    al:= al^.next;
  end;
end; 

var 
  BV: branchVector;
  SV: stringVector; 
  AL: accumulatingList;
begin 
  loadStringVector(SV);
  initializeVector(BV);
  loadVector(BV);
  pintVector(BV, SV);
  writeln('');
  accumulatingMerge(BV, AL);
  writeln('');
  printAccumulatingList(AL);
  readln();
end.
