type 
  ukazatel = ^elem_spiska;
  elem_spiska = record
    znach: integer;
    next: ukazatel;
  end;

var 
  head, pp, newelem: ukazatel;
  min,max:ukazatel;
  i:integer;

begin
  New(Head);
  pp := Head;
  min := Head;
  max := Head;
  
  for i:=1 to 10 do
  begin
  pp^.znach := random(100);
  write(pp^.znach,' ');
  
  if pp^.znach < min^.znach then
    min := pp;
  if pp^.znach > max^.znach then
    max := pp;
  
  if i <> 10 then
  begin
    New(newelem);
    pp^.next := newelem;
    pp := newelem;
  end;
  end;
  writeln;
  writeln(min^.znach,' ',max^.znach);
end.