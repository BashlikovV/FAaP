Program Project1;

Label
  ErrorLabel_1;

var
  Monks, LeadingNumber, SimpleNumber, DiscipleNumber, Cake, LeadingCake,
    DiscipleCake, SimpleCake: real;
  Test: boolean;

begin
ErrorLabel_1:
  Write('Количество съедаемых высшими монахами пирогов: ');
  ReadLn(LeadingCake);
  Write('Количество съедаемых учениками-монахами пирогов: ');
  ReadLn(DiscipleCake);
  Write('Количество съедаемых обычными монахами пирогов: ');
  ReadLn(SimpleCake);
  Write('Количество монахов: ');
  ReadLn(Monks);
  Write('Количество пирогов: ');
  ReadLn(Cake);
  WriteLn('Количество монахов := ', Monks:3:0, ' Количество пирогов := ',
    Cake:3:0);
  Test := false;
  DiscipleNumber := 0;
  while DiscipleNumber <= Monks do
  begin
    SimpleNumber := (Cake + DiscipleNumber * (LeadingCake - DiscipleCake) -
      Monks * LeadingCake) / (SimpleCake - LeadingCake);

    { Вычисление количества обычных монахов по выведеной формуле }
    if (SimpleNumber - Int(SimpleNumber) < 0.00000001) and (SimpleNumber >= 0)
    then

    { Проверка простоты SimpleNumber }
    begin
      LeadingNumber := Monks - SimpleNumber - DiscipleNumber;

      { Вычисление количества ведущих монахов }
      if LeadingNumber >= 0 then
      begin
        WriteLn('Ведущих монахов := ', LeadingNumber:3:0, ', обычных := ',
          SimpleNumber:3:0, ', учеников := ', DiscipleNumber:3:0);
        Test := true;

        { Вывод финальных результатов и изменение проверяющей переменной }
      end;
    end;
    DiscipleNumber := DiscipleNumber + 1;
  end;

  if Test = false then
  begin
    WriteLn('Для заданных значений: Monks :=', Monks:3:0, ', Cake :=', Cake:3:0,
      ' - решения нет');
    WriteLn('');
    WriteLn('Попробуйте еще раз');
    GoTo ErrorLabel_1;

    { Если нет подходящих значений - решения нет }
  end;
  ReadLn;

end.
