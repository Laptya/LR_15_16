type 
  ukazatel = ^elem_spiska;
  elem_spiska = record
    znach: integer;
    next: ukazatel;
  end;

var 
  head, pp, newelem: ukazatel;
  i:integer;
begin
  New(head);
  pp := head;
  for i:=1 to 10 do
  begin
    pp^.znach := random(100);
    write(pp^.znach,' ');
    if i <> 10 then
      begin
    New(newelem);
    pp^.next := newelem;
    pp := pp^.next;
    end;
  end;
  writeln;
  pp := head;
  i:=1;
  while pp <> nil do
  begin
    if i mod 2 = 0 then
      write(pp^.znach,' ');
    i:=i+1;
    pp := pp^.next;
  end;
end.
