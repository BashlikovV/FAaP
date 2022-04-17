program Project1;
{A sequence is given containing from 2 to 50 words, in each of which from
 1 to b lowercase Latin letters; between adjacent words - a comma or at
 least one space, after the last word - a dot. Print those words of the
 sequence that are different from the last word and satisfy the
 following property: - the word is symmetrical}

{$APPTYPE CONSOLE}

{$R *.res}

Uses
  System.SysUtils;

Const
  Dot = '.';
  Whitespace = ' ';
  Comma = ',';

  //Dot - dor/point
  //Whitespace - whitespace
  //Comma - Comma

Var
  Str, LastWord: String;
  Word, Temp, InvLine: String;
  I, J: integer;
  Checker: boolean;

  //Str - first string
  //LastWord - Last word in the first string
  //Word - single word
  //Temp - value from getting the last last word
  //InvLine - value from inverted word
  //I - counter of the cycle
  //J - counter of the cycle
  //Checker - Check from getting an answer

Begin

  //Start of the cycle C1
  Repeat
    Checker := True;
    Write('Введите вашу строку: ');
    ReadLn(Str);

    //Check Length(Str) <> 0
    if Length(Str) <> 0 then
    begin

      //Start of the cycle D1
      for I := 1 to length(Str) - 1 do
      begin
        //Check correct/uncorrect input
        if ((ord(Str[I]) < 96) or (ord(Str[I]) > 122))
          and (Str[I] <> Whitespace) and (Str[I] <> Comma) then
          Checker := False;

      //End of the cycle D1
      end;
    end
    else Str := Whitespace;

    if (Str = '') or ((pos(Whitespace, Str) = 0) and
      (pos(Comma, Str) = 0)) or (Checker = False)
      or (Str[length(Str)] <> Dot) then
      writeln('Ошибка ввода');

  //End of the cycle C1
  Until (Checker = True) and (Str[length(Str)] = Dot)
    and (Str <> '') and ((pos(Whitespace, Str) <> 0)
    or (pos(Comma, Str) <> 0));

  Temp := '';
  I := Length(Str) - 1;

  //Start of the cycle A1
  //Search the last word
  while (Str[I] <> Comma) and (Str[I] <> Whitespace) do
  begin
    Temp := Temp + copy(Str, I, 1);
    Dec(I);
  end;

  LastWord := '';

  //Start of the cycle A1.1
  for I := 1 to length(Temp) do LastWord := Temp[I] + LastWord;

  WriteLn('Исходная строка: ', Str);
  WriteLn('Последнее слово: ', LastWord);
  Write('Преобразованная строка: ');

  I := 1;
  //Start of the sycle A2
  while Str[I] <> Dot do
  begin

    //Checking (Str[I] <> Whitespace) and (Str[I] <> Comma)
    if (Str[I] <> Whitespace) and (Str[I] <> Comma) then
    begin
      Checker := True;
      Word := '';
      InvLine := '';

      //Start of the cycle B1
      //getting a single word
      while (Str[I] <> Whitespace) and (Str[I] <> Comma) and
        (I < Length(Str)) do
      begin
        Word := Word + Str[I];
        Inc(I);

      //End of the cycle B1
      end;

      //Start of the cycle B2
      //Getting a inverted word
      for J := Length(Word) downto 1 do
      begin
        InvLine := InvLine + Word[j];

      //End of the cycle B2
      end;

      //Start of the cycle B3
      //Chaeck from polindrom
      for J := Length(Word) downto 1 do
      Begin
        if Word[j] <> InvLine[j] then Checker := False;

      //End of the cycle B3
      End;

      //Check from polindrom
      if (Word <> LastWord) and (Checker = true) then write(Word, Whitespace);
    end
    else inc(I);

  //End of the cycle A2
  end;

  ReadLn;

end.
