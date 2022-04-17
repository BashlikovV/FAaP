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
   FirstSt:=N*StDisk;                                                            //������ ���������
   WriteLn('Pri pokupke disket po otdelnosty ih stoimost sostavit: ' +
   floattostr(FirstSt) + ' rub');
   WriteLn;

   Ya := N div 144;                                                              //������ ����� ������
   N:= N mod 144;                                                                // ���������� ����� �����
   Kor:= N div 12;                                                               //������ ����� �������
   N:= N mod 12;                                                                 // �������� ������

   Writeln('Dly ekonomii mozno kupit:');                                         //����� ������� ��������
   Writeln('  Yawikov - ' + inttostr(Ya));
   Writeln('  Korobok - ' + inttostr(Kor));
   Writeln('  Disket - ' + inttostr(N));
   Writeln('------');
   Writeln('Stoimost: ' + floattostr(StDisk*N + StKor*Kor+StYa*Ya)+' rub');
   WriteLn;

   if N*StDisk >= StKor then                                                     //���� ������� ������ ������� � �������� ������� � �������
   begin
     N:=0;
     Kor:=Kor+1;
   end;

   if Kor*StKor >= StYa then                                                     //���� ������� ������ ���� � �������� ������� � �������
   begin
     Kor:=0;
     N:=0;
     Ya:=Ya+1;
   end;

   Writeln('Ili dly ekonomii mozno kupit:');                                     //����� ������� ��������
   Writeln('  Yawikov - ' + inttostr(Ya));
   Writeln('  Korobok - ' + inttostr(Kor));
   Writeln('  Disket - ' + inttostr(N));
   Writeln('------');
   SecondSt:= StDisk*N + StKor*Kor+StYa*Ya;
   Writeln('Stoimost: ' + floattostr(SecondSt)+' rub');
   WriteLn;

   Writeln('Pri ispolzovanii tretego varianta, vu sekonomite: ' +                //����� ������� � ���������
   floattostr(FirstSt-SecondSt) + ' rub');
  ReadLn;
end.
