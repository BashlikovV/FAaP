program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  r,rtemp,g,i,k : integer;
begin
  Write('Vvedite kolichestvo krasnuh bakteriy: ');
  Readln(r);
  Write('Vvedite kolichestvo taktov: ');
  Readln(k);
  g:=0;                                                                         //������ ������� - 0
  for i:= 1 to k do
  begin
	  rtemp:=g;                                                                   // ��������� ����� ������
	  g:=g+r;                                                                     // ������� ����� ����� ������
	  r:=rtemp;                                                                   // ����� ����� ������� ����� ������� ����� ������
  end;

  WriteLn('Posle ' + inttostr(k) + ' taktov stalo:');
  WriteLn(' Krasnux bakteriy:' + inttostr(r));
  WriteLn(' Zelenux bakteriy:' + inttostr(g));
  WriteLn('-------------------------');
  WriteLn(' Vsego:' + inttostr(r+g));

  Readln;
end.
