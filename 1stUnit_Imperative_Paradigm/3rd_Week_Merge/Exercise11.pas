program ExcEleven; 
const 
  BREAK = -1; 
  GENRE_QUA = 8; 
  MAX_VALUE = MAXINT; 
type  
  genres = 1..GENRE_QUA; 
  
  movie = record 
    filmCode: integer; 
    genCode: genres; 
    score: real; 
  end; 
  
  list = ^node; 
  node = record 
    data: movie; 
    next: list;
  end; 
  
  stringVector = array[genres] of string[30];
  genreVector = array[genres] of list;
  maximumScores = array[genres] of movie; 

procedure loadStringVector(var sv: stringVector);
var 
  i: integer;
begin
  for i:= 1 to GENRE_QUA do begin 
    writeln('Load the name of the genre ', i);
    readln(sv[i]);
  end;
end;

procedure initializeVector(var gv: genreVector);
var
  i: integer; 
begin 
  for i:= 1 to GENRE_QUA do 
    gv[i]:= nil;
end; 

procedure insertSorted(var l: list; m: movie);
var 
  bfr, act, n: list; 
begin 
  new(n);
  n^.data:= m;
  bfr:= l; 
  act:= l; 
  while(act <> nil) and (act^.data.filmCode < m.filmCode) do begin 
    bfr:= act;
    act:= act^.next;
  end; 
  if(bfr = act) then  
    l:= n
  else 
    bfr^.next:= n;
  n^.next:= act;
end; 

procedure readMovie(var m: movie);
begin 
  writeln('Insert the movie id');
  readln(m.filmCode);
  if(m.filmCode <> BREAK) then begin 
    writeln('Insert the code of movie genre');
    readln(m.genCode);
    writeln('Insert the average score given by the critics');
    readln(m.score);
  end;
end; 

procedure loadVector(var gv: genreVector);
var 
  m: movie;
begin 
  readMovie(m);
  while(m.filmCode <> BREAK) do begin 
    insertSorted(gv[m.genCode], m);
    readMovie(m);
  end;
end; 

procedure loadNewVector(gv: genreVector; var ms: maximumScores);
var 
  gen: integer; 
  actual: movie; 
begin 
  for gen:= 1 to GENRE_QUA do begin
    actual.score:= -1; 
    while(gv[gen] <> nil) do begin 
      if(gv[gen]^.data.score > actual.score) then
        actual:= gv[gen]^.data;
      gv[gen]:= gv[gen]^.next;
    end; 
    ms[gen]:= actual;
  end;
end;

procedure sortVector(var ms: maximumScores);
var 
  i, j: integer; 
  actual: movie;
begin 
  for i:= 2 to GENRE_QUA do begin 
    actual:= ms[i];
    j:= i - 1;
    while(j > 0) and (ms[j].score > actual.score) do begin 
      ms[j + 1]:= ms[j];
      j:= j - 1;
    end;
    ms[j + 1]:= actual;
  end; 
end; 

procedure displayVector(gv: genreVector; sv: stringVector);
var 
  i: integer;
begin 
  for i:= 1 to GENRE_QUA do begin 
    writeln('Following movies correspond to the genre of: ', sv[i]);
    while(gv[i] <> nil) do begin 
      write('{Film id: ', gv[i]^.data.filmCode);
      write(' | Average Score: ', gv[i]^.data.score: 0: 2, '}');
      gv[i]:= gv[i]^.next;
    end;
    writeln('');
  end;
end; 

procedure displayNewVector(ms: maximumScores; sv: stringVector);
var 
  i: integer;
begin 
  for i:= 1 to GENRE_QUA do begin 
    writeln('The movie with maximum score of the genre of ', sv[i], ' contains the following data: ');
    writeln('{Film id}: ', ms[i].filmCode);
    write(' | Average Score: ', ms[i].score: 0: 2, '}');
  end;
end; 

procedure showCodes(ms: maximumScores);
begin
  writeln('The minimum score film code is: ', ms[1].filmCode);
  writeln('The maximum score film code is: ', ms[GENRE_QUA].filmCode);
end; 

procedure displayData(data: movie);
begin 
  writeln(' Film Code: ', data.filmCode, ' Genre Code: ', data.genCode, ' Score: ', data.score: 0: 2);
end;

procedure printList(l: list);
begin 
  while(l <> nil) do begin 
    displayData(l^.data);
    l:= l^.next;
  end;
end; 

procedure addAtLast(var first, last: list; m: movie);
var 
  n: list;
begin 
  new(n);
  n^.data:= m;
  n^.next:= nil;
  if(first <> nil) then 
    last^.next:= n
  else 
    first:= n;
  last:= n;
end; 

procedure selectMinimum(var gv: genreVector; var min: movie);
var 
  i, minPos: integer;
begin 
  min.filmCode:= MAX_VALUE; 
  for i:= 1 to GENRE_QUA do begin 
    if(gv[i] <> nil) and (gv[i]^.data.filmCode < min.filmCode) then begin 
      min:= gv[i]^.data;
      minPos:= i;
    end;
  end;
  if(min.filmCode <> MAX_VALUE) then 
    gv[minPos]:= gv[minPos]^.next;
end; 
      
procedure merge(gv: genreVector; var newList: list);
var 
  min: movie;
  last: list;
begin 
  newList:= nil;
  last:= nil;
  selectMinimum(gv, min);
  while(min.filmCode <> MAX_VALUE) do begin 
    addAtLast(newList, last, min);
    selectMinimum(gv, min);
  end;
end; 

var 
  GV: genreVector; 
  MS: maximumScores;
  SV: stringVector;
  L: list; 
begin 
  loadStringVector(SV);
  initializeVector(GV);
  loadVector(GV);
  displayVector(GV, SV);
  loadNewVector(GV, MS);
  writeln('The movie with maximum score of each genre are following specified: ');
  displayNewVector(MS, SV);
  sortVector(MS);
  writeln('Following it prints movie codes of best and worst ranked films according to the critis');
  showCodes(MS);
  writeln('');
  merge(GV, L);
  printList(L);
  readln();
end. 
