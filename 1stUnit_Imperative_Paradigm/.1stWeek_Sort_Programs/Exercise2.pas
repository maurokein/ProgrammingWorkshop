program ExcTwo;
const 
	 BREAK = -1;
	 GENRE_QUA = 8;
type 
	genres = 1..GENRE_QUA;
  
	movie = record 
		codFilm: integer;
		codGen: genres; 
		score: real;
	end;
  
	list = ^node;
	node = record 
		data: movie;
		next: list; 
	end;
	
	stringVector = array [genres] of string[30]; 
	genreVector = array [genres] of list;
	highestScore = array [genres] of movie; 
  
 
procedure loadStringVector(var str: stringVector);
var 
    i: integer;
begin 
    for i:= 1 to GENRE_QUA do begin
        writeln('Insert the genre ', i);
        readln(str[i]);
    end;
end;

procedure initializeVector(var gv: genreVector);
var 
    i: integer;
begin 
    for i:=1 to GENRE_QUA do
        gv[i]:= nil; 
end;


procedure addBack(var l, last: list; m: movie);
var 
    n: list;
begin 
    new(n);
    n^.data:= m;
    n^.next:= nil;
    if(l=nil) then
        l:= n
    else
        last^.next:= n;
    last:= n;
end;


procedure readMovie(var m: movie);
begin 
    writeln('Insert the movie id');
    readln(m.codFilm);
    if (m.codFilm <> BREAK) then begin 
        writeln('Insert the code of movie genre');
        readln(m.codGen);
        writeln('Insert the average score given by the critics');
        readln(m.score);
    end;
end;
        

procedure loadVector (var gv: genreVector);
var 
    film: movie;
    last:list;
begin 
    readMovie(film);
    while (film.codFilm <> BREAK) do begin 
		    addBack(gv[film.codGen], last, film);
        readMovie(film);
    end;
end;

procedure loadNewVector(gv: genreVector; var hs: highestScore);
var 
    genre: integer;
    actual: movie;
begin
    for genre:= 1 to GENRE_QUA do begin 
        actual.score:= -1;
        while(gv[genre] <> nil) do begin 
            if (gv[genre]^.data.score > actual.score) then 
                actual:= gv[genre]^.data;
            gv[genre]:=gv[genre]^.next;
        end;
        hs[genre]:= actual;
    end;
end; 

procedure sortVector(var hs: highestScore);
var 
    i, j: integer; 
    actual: movie;
begin 
    for i:= 2 to GENRE_QUA do begin 
        actual:= hs[i];
        j:= i-1;
        while (j > 0) and (hs[j].score > actual.score) do begin 
            hs[j + 1]:= hs[j];
            j:= j - 1;
        end;
        hs[j+1]:= actual;
    end;
end; 

procedure displayVector(gv: genreVector; sv: stringVector);
var 
    i: integer;
begin 
    for i:= 1 to GENRE_QUA do begin 
        writeln('The following films correspond to the genre of: ', sv[i]);
        while(gv[i] <> nil) do begin 
            writeln('{Film id: ', gv[i]^.data.codFilm);
            writeln('Average score: ', gv[i]^.data.score: 0: 2, '}');
            gv[i]:= gv[i]^.next;
        end;
    end;
end;

procedure displayNewVector(hs: highestScore; sv: stringVector);
var 
    i: integer;
begin 
    for i:= 1 to GENRE_QUA do begin
        writeln('The film with highest score from the genre of: ', sv[i]); 
        write (' has the following data: ');
        writeln('{Film id: ', hs[i].codFilm);
        writeln('Average score: ', hs[i].score: 0: 2, '}');
    end;
end;

procedure showCodes(hs: highestScore);
begin 
    writeln('The film code with lowest score is: ', hs[1].codFilm);
    writeln('The film code with highest score is: ', hs[GENRE_QUA].codFilm);
end;

var 
  GV: genreVector;
  HS: highestScore;
  SV: stringVector;
begin
    loadStringVector(SV);
    initializeVector(GV);
    loadVector(GV);
    displayVector(GV, SV);
    loadNewVector(GV, HS);
    writeln('The highest scoring movies of each genre are specified below');
    displayNewVector(HS, SV);
    sortVector(HS);
    writeln('The best and worst-ranked movies according to critics are specified below');
    showCodes(HS);
    readln;
end.
