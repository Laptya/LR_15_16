program T1;
// В данном коде используется динамическая структура данных связанного списка. 
//Особенностью связанного списка является то, 
//что каждый узел содержит указатель на следующий узел, что позволяет 
//эффективно добавлять и удалять элементы.
type
  PNode = ^Node;
  Node = record
    //состав узла структуры
    _Word: string; //поле для хранения слова
    Counter: integer; //поле для хранения количества встречающихся слов
    Next: PNode; //указатель на следующий узел списка
  end;

var
  Head, NewNode, q: PNode;
  Counter: integer;
  w: string;
  f: text;

function GetWord(f: text): string; //функция для чтения слов из файла
var
  c: char;
begin
  Result := '';
  c := ' ';
  while not (EOF(f)) and (c <= ' ') do
    Read(f, c);
  while not (EOF(f)) and (c >  ' ') do
  begin
    Result += c;
    Read(f, c);
  end;
end;

function Find(Head: PNode; NewWord: string): PNode; //функция поиска узла в списке по заданному слову
var
  q: PNode;
begin
  q := Head;
  while (q <> nil) and (q^._Word <> NewWord) do
    q := q^.Next;
  Result := q;
end;

function CreateNode(NewWord: string): PNode; //функция для создания нового узла с заданным словом
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^._Word   := NewWord;
  NewNode^.Counter := 1;
  NewNode^.Next    := nil;
  Result := NewNode;
end;

function FindPlace(Head: PNode; NewWord: string): PNode;//функция для нахождения места вставки нового узла в 
var
  q: PNode;
begin
  q := Head;
  while (q <> nil) and (NewWord > q^._Word) do
    q := q^.Next;
  Result := q;
end;

procedure AddFirst(var Head: PNode; NewNode: PNode);//процедура для добавления нового узла в начало списка
begin
  NewNode^.Next := Head;
  Head := NewNode;
end;

procedure AddAfter(p, NewNode: PNode);// процедура для добавления нового узла после определенного узла
begin
  NewNode^.Next := p^.Next;
  p^.Next := NewNode;
end;

procedure AddBefore(var Head: PNode; p, NewNode: PNode);//процедура для добавления нового узла перед определенным узлом
var
  q: PNode;
begin
  q := Head;
  if (p = Head) then
    AddFirst(Head, NewNode)
  else begin
    while (q <> nil) and (q^.Next <> p) do
      q := q^.Next;
    if (q <> nil) then
      AddAfter(q, NewNode);
  end;
end;

begin
  Head := nil;
  Assign(f, 'input.txt'); Reset(f);
  
  while not eof(f) do
  begin
    w := GetWord(f);
    if (w = '') then 
      break;
    q := Find(Head, w);
    if (q <> nil) then
      Inc(q^.Counter)
    else begin
      NewNode := CreateNode(w);
      q := FindPlace(Head, w);
      AddBefore(Head, q, NewNode);
    end;
  end;
  
  Close(f);
  Assign(f, 'output.txt'); 
  Rewrite(f);
  q := Head;
  Counter := 0;
  
  while (q <> nil) do
  begin
    Inc(Counter);
    Writeln(f, q^._Word, ': ', q^.Counter);
    q := q^.Next;
  end;
  
  Writeln(f, Counter, ' уникальных слова ');  
  Writeln(Counter, ' уникальных слова ');
  Close(f);
end.