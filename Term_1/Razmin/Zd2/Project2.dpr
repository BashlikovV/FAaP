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
  g:=0;                                                                         //зелёных сначала - 0
  for i:= 1 to k do
  begin
	  rtemp:=g;                                                                   // запомиаем число зелёных
	  g:=g+r;                                                                     // считаем новое число зелёных
	  r:=rtemp;                                                                   // новое число красных равно старому числу зелёных
  end;

  WriteLn('Posle ' + inttostr(k) + ' taktov stalo:');
  WriteLn(' Krasnux bakteriy:' + inttostr(r));
  WriteLn(' Zelenux bakteriy:' + inttostr(g));
  WriteLn('-------------------------');
  WriteLn(' Vsego:' + inttostr(r+g));

  Readln;
end.
