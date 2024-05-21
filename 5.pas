
const max = 100;

type Stack = record  
      tags: array[1..max] of integer;
      size: integer; 
     end;

procedure Push( var S: Stack; x: integer);
begin
  if S.size = max then Exit;  
  S.size := S.size + 1;
  S.tags[S.size] := x; 
end;

function Pop ( var S:Stack ): integer;
begin
  if S.size = 0 then begin
    Result := 0;
    Exit;
  end;
  Result := S.tags[S.size];
  S.size := S.size - 1;
end;

function isEmptyStack ( S: Stack ): Boolean;
begin
  Result := (S.size = 0);
end;

var
  inputt, outputt: text;
  x: integer;
  S: Stack;

begin
  
  Assign(inputt, 'spis.txt');
  Assign(outputt, 'spis2.txt');
  Reset(inputt);
  Rewrite(outputt);
  
  while not EOF(inputt) do begin
    Readln(inputt, x);
    Push(S, x);
  end;
  
  Begin
  While (S.size > 0) do
    writeln(outputt, Pop(s));
  end;
  Close(inputt);
  Close(outputt);
end.
