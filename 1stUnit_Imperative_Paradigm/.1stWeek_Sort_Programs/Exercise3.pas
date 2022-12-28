program ExcThree;
const 
	 BREAK = -1;
	 BRANCH_QUA = 6; //branch quantity 
type 
    branches = 1..BRANCH_QUA;

    product = record   
        codProd: integer;
        codBranch: branches;
        price: real; 
    end; 

    list = ^node;
	  node = record 
		  data: product;
		  next: list; 
	  end;

    stringVector = array [branches] of string[20]; 
    branchVector = array [branches] of list;
    branch3Vector = array [1..30] of product; // Honestly, I don´t remember what is this for 

procedure loadStringVector(var sv: stringVector);
var 
    i: integer;
begin 
    for i:= 1 to BRANCH_QUA do begin
        writeln('Insert the branch name ', i);
        readln(sv[i]);
    end;
end;

procedure initializeVector(var bv: branchVector);
var 
    i: integer;
begin 
    for i:=1 to BRANCH_QUA do
        bv[i]:= nil; 
end;

procedure sortedInsert (var l: list; p: product);
var 
  n: list;
  actual, previous: list;
  begin
    new(n);
    n^.data:=p;
    actual:= l; 
    previous:= l;
    while (actual<>nil) and (p.codProd > actual^.data.codProd) do 
    begin 
        previous:= actual;
        actual:= actual^.next;
    end;
    if(actual=previous) then
        l:=n 
    else
        previous^.next:=n;
    n^.next:=actual;
end; 

procedure readProduct(var p: product);
begin 
    writeln('Insert the product´s price: ');
    readln(p.price);
    if (p.price <> BREAK) then begin 
        writeln('Insert the product code');
        readln(p.codProd);
        writeln('Insert the branch code (1 to 6)');
        readln(p.codBranch);
    end;
end;

procedure loadVector (var bv: branchVector);
var 
    prod: product;
begin 
    readProduct(prod);
    while (prod.price <> BREAK) do begin 
		    sortedInsert(bv[prod.codBranch], prod);
        readProduct(prod);
    end;
end;

procedure displayVector(bv: branchVector; sv: stringVector);
var 
    i: integer;
begin 
    for i:= 1 to BRANCH_QUA do begin 
        writeln('The following product codes corresponds to the branch of: ', sv[i]);
        while(bv[i] <> nil) do begin 
            writeln('{Product Code: ', bv[i]^.data.codProd);
            writeln('Price: ', bv[i]^.data.price: 0: 2, '}');
            bv[i]:= bv[i]^.next;
        end;
    end;
end;

procedure loadBranch3Vector(var b3v: branch3Vector; bv: branchVector; var lDim: integer);
begin
    lDim:= 0; //Logical dimension of the array 
    while(bv[3] <> nil) and (lDim<=30) do
    begin   
        lDim:= lDim + 1;
        b3v[lDim]:= bv[3]^.data;
        bv[3]:= bv[3]^.next;
    end;
end; 

procedure sortVector(var b3v: branch3Vector; lDim: integer);
var 
    i, j: integer; 
    actual: product;
begin 
    for i:= 2 to lDim do begin 
        actual:= b3v[i];
        j:= i-1;
        while (j > 0) and (b3v[j].price > actual.price) do begin 
            b3v[j + 1]:= b3v[j];
            j:= j - 1;
        end;
        b3v[j+1]:= actual;
    end;
end; 

procedure displayVector(b3v: branch3Vector; lDim: integer);
var 
    i: integer;
begin 
    writeln('The prices were loaded at the following way: ');
    writeln('');
    for i:= 1 to lDim do 
        writeln(b3v[i].price:0:2, ' | ');
end;

var 
    BV: branchVector;
    SV: stringVector;
    B3V: branch3Vector;
    lDim: integer;
begin 
    loadStringVector(SV);
    initializeVector(BV);
    loadVector(BV);
    displayVector(BV, SV);
    writeln('');
    loadBranch3Vector(B3V, BV, lDim);
    displayVector(B3V, lDim);
    writeln('');
    sortVector(B3V, lDim);
    writeln('');
    displayVector(B3V, lDim);
    readln;
end.
