Program project1;

Uses
  SysUtils;

Var
  P, Q, S, i, j: Integer;
  Error: Integer;
  TestValue: String;

  {
   P - Значенние числа P
   Q - Значенние числа Q
   i - Счетчик цикла, принимающий значение делителей числа Q
   S - Если ответ не найден принимает значение 0, в противном случае 1
   j - Счетчик цикла проверяющего числа P и i на простоту
   Error - Переменная принимающая значение 1, если введены не верные значения
   TestValue - Принимает значение введенного числа
  }

begin

  //S - если = 1, значит найден ответ
  S := 1;

  //Error отвечает за проверку на ошибки в функции Val
  Error := 0;

  //Проверка на корректность введенного значения
  Repeat
    Write('Введите число P: ');
    Readln(TestValue);
    Val(TestValue, P, Error);

    If (P < 0) or (Error <> 0) then
    Begin
      Writeln('Incorrect value');
    End;
  Until (Error = 0) and (P >= 0);

  //Проверка на корректность введенного значения
  Repeat
    Write('Введите число Q: ');
    Readln(TestValue);
    Val(TestValue, Q, Error);

    If (Q < 0) or (Error <> 0) then
    Begin
      Writeln('Incorrect value');
    End;
  Until (Error = 0) and (Q >= 0);

  // Цикл находящий делители числа Q
  for i := 2 to q do
  begin

    // Находим все делители числа Q
    if q mod i = 0 then
    begin

      // Цикл проверки на простоту чисел P, i
      for j := 2 to round(sqrt(i)) + 1 do
      begin

        // Если P и I делятся без остатка, то они составные
        if (i mod j = 0) and (p mod j = 0) then
          s := 0;
      end;

      // Если P и i делятся с остатком, то они простые
      if s = 1 then
      begin
        Writeln('Делитель числа ', q, ':= ', i,
          ' - взаимно простое число с числом ', p);
      end;
      s := 1;
    end;
  end;
  Readln;

end.
