program ExcThirteen; 
const 
  BREAK = 0; 
  MAX = MAXINT; 
  DAYS_QUA = 7; 
type 
  days = 1..DAYS_QUA;
  
  ticket = record 
    day: days; 
    opus_code: integer; 
    seat: integer; 
    cost: real;
  end; 
  
  list = ^node; 
  node = record 
    data: ticket; 
    next: list; 
  end; 

  dayVector = array[days] of list; 
  
  totalTickets = record 
    opus_code: integer; 
    totalSales: integer; 
  end; 
  
  newList = ^nodeN;
  nodeN = record 
    data: totalTickets; 
    next: newList;
  end; 
  
procedure initializeVector(var dv: dayVector);
var 
  i: integer;
begin 
  for i:= 1 to DAYS_QUA do 
    dv[i]:= nil;
end; 

procedure readTicket(var t: ticket);
begin 
  writeln('Insert opus code');
  readln(t.opus_code);
  if(t.opus_code <> BREAK) then begin 
    writeln('Insert opus day (1 to 7)');
    readln(t.day);
    writeln('Insert seat number');
    readln(t.seat);
    writeln('Insert cost');
    readln(t.cost);
  end;
end; 

procedure insertSort(var l: list; t: ticket); 
var 
  prev, act, n: list;
begin 
  new(n);
  n^.data:= t;
  prev:= l;
  act:= l;
  while(act <> nil) and (act^.data.opus_code < t.opus_code) do begin 
    prev:= act;
    act:= act^.next;
  end;
  if(prev = act) then 
    l:= n
  else 
    prev^.next:= n;
  n^.next:= act;
end; 

procedure addAtLast(var l, last: newList; data: totalTickets);
var 
  nl: newList;
begin 
  new(nl);
  nl^.data:= data;
  nl^.next:= nil;
  if(l = nil) then 
    l:= nl
  else 
    last^.next:= nl;
  last:= nl;
end; 

procedure loadDayVector(var dv: dayVector);
var 
  t: ticket;
begin 
  readTicket(t);
  while(t.opus_code <> BREAK) do begin 
    insertSort(dv[t.day], t);
    readTicket(t);
  end;
end; 

procedure displayList(l: list);
begin 
  if(l = nil) then 
    writeln('This list is empty')
  else begin 
    writeln('The data in the list is following detailed: ');
    while(l <> nil) do begin 
      writeln('{Day: ', l^.data.day, ' | Opus: ', l^.data.opus_code, ' | Seat: ', l^.data.seat, '}');
      l:= l^.next; 
    end; 
  end; 
end; 

procedure displayMergedList(ml: newList); 
begin 
  while(ml <> nil) do begin 
    writeln('The opus with code: ', ml^.data.opus_code, ' have ', ml^.data.totalSales, ' sold tickets so far');
    ml:= ml^.next;
  end; 
end; 

procedure printVector(dv: dayVector);
var 
  i: integer; 
begin 
  for i:= 1 to DAYS_QUA do 
    displayList(dv[i]);
end; 

procedure selectMinimum(var dv: dayVector; var min: ticket); 
var 
  i, minPos: integer;
begin 
  min.opus_code:= MAX;
  for i:= 1 to DAYS_QUA do begin  
    if(dv[i] <> nil) and (dv[i]^.data.opus_code < min.opus_code) then begin 
      min:= dv[i]^.data;
      minPos:= i;
    end; 
  end;
  if(min.opus_code <> MAX) then 
    dv[minPos]:= dv[minPos]^.next;
  end; 
  
  procedure accumulatingMerge(dv: dayVector; var nl: newList);
  var 
    min: ticket;
    last: newList; 
    actual: totalTickets;
  begin 
    nl:= nil;
    last:= nil;
    selectMinimum(dv, min); 
    while(min.opus_code <> MAX) do begin 
      actual.opus_code:= min.opus_code;
      actual.totalSales:= 0;
      while(actual.opus_code = min.opus_code) do begin 
        actual.totalSales:= actual.totalSales + 1;
        selectMinimum(dv, min);
      end; 
      addAtLast(nl, last, actual); 
    end; 
  end; 
  
  var 
    DV: dayVector; 
    NL: newList;
  begin 
    initializeVector(DV);
    loadDayVector(DV);
    writeln('');
    printVector(DV);
    writeln('');
    accumulatingMerge(DV, NL);
    writeln('');
    displayMergedList(NL);
  end.
