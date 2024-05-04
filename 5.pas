//В данном коде используется статическая структура стека. 
//Основная особенность стека заключается в том, что данные 
//хранятся в порядке последним пришел - первым вышел (Last In, First Out - LIFO).

const max = 100;
//Состав узла структуры Stack:
type Stack = record  
      tags: array[1..max] of integer; //массив для хранения элементов стека
      size: integer; //переменная для хранения текущего размера стека
     end;

procedure Push( var S: Stack; x: integer);//процедура для добавления элемента в стек
begin
  if S.size = max then Exit;  
  S.size := S.size + 1;
  S.tags[S.size] := x; 
end;

function Pop ( var S:Stack ): integer;//функция для извлечения элемента из стека
begin
  if S.size = 0 then begin
    Result := 0;
    Exit;
  end;
  Result := S.tags[S.size];
  S.size := S.size - 1;
end;

function isEmptyStack ( S: Stack ): Boolean;//функция для проверки стека на пустоту
begin
  Result := (S.size = 0);
end;

var
  inputt, outputt: text;
  x: integer;
  S: Stack;

begin
  
  Assign(inputt, 'D:\Алембаев Артём ИСПк 204-52-00\LR_15-16\spis.txt');
  Assign(outputt, 'D:\Алембаев Артём ИСПк 204-52-00\LR_15-16\spis2.txt');
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
