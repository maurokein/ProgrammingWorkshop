program ExcTen;
const 
  INGRESS_YEAR = 2000;
  FILENUMBER_1 = 12803;
  FILENUMBER_2 = 2803;
  FILENUMBER_3 = 6982;
  BREAK = 'ZZZ';
type 
  student = record 
    Name: string; 
    LastName: string; 
    Id: integer; 
    FileNumber: integer; 
    Ingress: integer; 
  end; 
  
  tree = ^node;
  node = record 
    data: student; 
    LC: tree;
    RC: tree;
  end; 
  
procedure readStudent(var s: student);
begin   
  writeln('Insert name');
  readln(s.Name);
  if(s.Name <> BREAK) then begin 
    writeln('Insert lastname');
    readln(s.LastName);
    writeln('Insert id');
    readln(s.Id);
    writeln('Insert file number');
    readln(s.FileNumber);
    writeln('Insert year of ingress');
    readln(s.Ingress);
  end; 
end;
  
procedure insertStudent(var t: tree; s: student);
begin 
  if(t = nil) then begin 
    new(t);
    t^.data:= s; 
    t^.LC:= nil;
    t^.RC:= nil;
  end
  else begin 
    if(s.FileNumber < t^.data.FileNumber) then 
      insertStudent(t^.LC, s)
    else 
      insertStudent(t^.RC, s);
  end;
end; 
  
procedure createTree(var t: tree);
var 
  s: student;
begin 
  readStudent(s);
  while(s.Name <> BREAK) do begin 
    if(s.Ingress > INGRESS_YEAR) then
      insertStudent(t, s);
	readStudent(s);
  end;
end; 

procedure displayDataRecord(s: student);
begin 
	write('Name: ', s.Name);
	write(' | ');
	write('LastName: ', s.LastName);
	writeln('');
end; 

procedure displayTree(t: tree);
begin 
	if(t <> nil) then begin 
		displayTree(t^.LC);
		displayDataRecord(t^.data);
		displayTree(t^.RC);
	end; 
end;
		
procedure conditionB(t: tree);
begin 
  if(t <> nil) then begin 
    if(t^.data.FileNumber > FILENUMBER_1) then begin
		displayDataRecord(t^.data);
		conditionB(t^.RC);
	end
	else 
		conditionB(t^.RC);
  end;
end;

procedure conditionC(t: tree);
begin 
  if(t <> nil) then begin 
	if(t^.data.FileNumber > FILENUMBER_2) and (t^.data.FileNumber < FILENUMBER_3) then begin 
		displayDataRecord(t^.data);
		conditionC(t^.LC);
		conditionC(t^.RC);
	end;
  end; 
end; 

var 
  t: tree;
begin 
  t:= nil;
  createTree(t);
  writeln('');
  writeln('Student data: ');
  displayTree(t);
  writeln('');
  writeln('CONDITION B RESULT: ');
  conditionB(t);
  writeln('');
  writeln('CONDITION C RESULT: ');
  conditionC(t);
end.
