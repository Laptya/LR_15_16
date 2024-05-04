var
  i_ptr:^integer;
  i:integer;
  begin
  i:=2;
  i_ptr:=@i;
  writeln('Значение = ',i_ptr^);
  end.