program LBR7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Windows;

const
  DeafConsonants = ['к', 'п', 'с', 'т', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'a', 'b'];
  DCInAlphabet: string = 'кпстфхцчшщab';

type
  TSet = set of Char;
  TMyException = class (Exception);

var
  SetArray: array of TSet;
  Str, CopyStr: string;
  i, j, n: Integer;
  Plenty, SplPlenty: TSet;
  k: Char;

  //StrSet -
  //DeafConsonants -

begin
  //SetConsoleCP(1251);
  //SetConsoleOutputCP(1251);

  Writeln('Введите строку, вставляя пробелы между словами');
  repeat
    ReadLn(Str);
    if (Pos(' ', Str) = 0) then Writeln('В Строке только одно слово. Введите повторно');
  until (Pos(' ', Str) > 1);

  Str := Str + ' ';

  n := 0;
  while (Pos(' ', Str) > 0) do
  begin
    CopyStr := Copy(Str, 1, Pos(' ', Str) - 1);
    Inc(n);
    SetLength(SetArray, n);

    SetArray[n] := [];

    for j := 1 to Length(CopyStr) do
    begin
      if (CopyStr[j] in DeafConsonants) then
        SetArray[n - 1] := SetArray[n - 1] + [CopyStr[j]];
    end;

    delete(Str , 1, Pos(' ',Str));
  end;

  SplPlenty := [];
  for i := 1 to n do
  begin
    Plenty := [];
    for j := 1 to n do
    begin
      if (j <> i) then Plenty := Plenty + SetArray[j];
    end;
    SplPlenty := SplPlenty + (SetArray[i] * Plenty);
  end;

  if (SplPlenty = []) then WriteLn('Таких букв не существует')
  else
  begin
    Writeln('Буквы, входящие только в одно слово: ');
    for i := 1 to Length(DCInAlphabet) do
      if (DCInAlphabet[i] in SplPlenty) then write(DCInAlphabet[i],' ');
  end;

  Readln;
end.
