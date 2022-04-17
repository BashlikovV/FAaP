program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  v, cake, monks, p, u, i: Integer;
  check: Boolean;

begin
  Write('Введите количество монахов: ');
  Readln(monks);
  Write('Введите количество пирогов: ');
  Readln(cake);

  check := false;

  for v := 0 to (cake div 10) do // перебираем число возможных высших монахов
  begin
    p := 2 * cake - monks - 19 * v; // Из решения системы
    if ((p mod 9 = 0) and (p >= 0)) then
    // кол-во простых должно быть целым и больше 0
    begin
      u := monks - (p div 9) - v; // кол-во учеников
      if (u >= 0) then // кол-во учеников должно быть целым и больше 0
      begin
        WriteLn('');
        WriteLn('Высших монахов := ', v);
        WriteLn('Простых монахов := ', p div 9);
        WriteLn('Учеников := ', u);
        check := true;
      end;
    end;
  end;

  if check = false then
    WriteLn('Нет решения');

  Readln;

end.
