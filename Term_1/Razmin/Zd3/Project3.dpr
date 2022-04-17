program Project3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  StDisk : Double = 11.5;
  StKor : Double = 114.5;
  StYa : Double = 1255;
var
  N,Kor,Ya:Integer;
  FirstSt,SecondSt:Double;
begin
   Write('Vvedite kolichestvo disket: ');
   Readln(N);
   FirstSt:=N*StDisk;                                                            //Полная стоимость
   WriteLn('Pri pokupke disket po otdelnosty ih stoimost sostavit: ' +
   floattostr(FirstSt) + ' rub');
   WriteLn;

   Ya := N div 144;                                                              //Первое число ящиков
   N:= N mod 144;                                                                // Оставшееся число диске
   Kor:= N div 12;                                                               //Первое число коробок
   N:= N mod 12;                                                                 // Осталось дискет

   Writeln('Dly ekonomii mozno kupit:');                                         //Вывод первого варианта
   Writeln('  Yawikov - ' + inttostr(Ya));
   Writeln('  Korobok - ' + inttostr(Kor));
   Writeln('  Disket - ' + inttostr(N));
   Writeln('------');
   Writeln('Stoimost: ' + floattostr(StDisk*N + StKor*Kor+StYa*Ya)+' rub');
   WriteLn;

   if N*StDisk >= StKor then                                                     //Если выгодно купить коробку и получить дискету в подарок
   begin
     N:=0;
     Kor:=Kor+1;
   end;

   if Kor*StKor >= StYa then                                                     //Если выгодно купить ящик и получить коробку в подарок
   begin
     Kor:=0;
     N:=0;
     Ya:=Ya+1;
   end;

   Writeln('Ili dly ekonomii mozno kupit:');                                     //Вывод второго варианта
   Writeln('  Yawikov - ' + inttostr(Ya));
   Writeln('  Korobok - ' + inttostr(Kor));
   Writeln('  Disket - ' + inttostr(N));
   Writeln('------');
   SecondSt:= StDisk*N + StKor*Kor+StYa*Ya;
   Writeln('Stoimost: ' + floattostr(SecondSt)+' rub');
   WriteLn;

   Writeln('Pri ispolzovanii tretego varianta, vu sekonomite: ' +                //Вывод разницы в стоимости
   floattostr(FirstSt-SecondSt) + ' rub');
  ReadLn;
end.
