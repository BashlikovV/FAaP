program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  v, cake, monks, p, u, i: Integer;
  check: Boolean;

begin
  Write('������� ���������� �������: ');
  Readln(monks);
  Write('������� ���������� �������: ');
  Readln(cake);

  check := false;

  for v := 0 to (cake div 10) do // ���������� ����� ��������� ������ �������
  begin
    p := 2 * cake - monks - 19 * v; // �� ������� �������
    if ((p mod 9 = 0) and (p >= 0)) then
    // ���-�� ������� ������ ���� ����� � ������ 0
    begin
      u := monks - (p div 9) - v; // ���-�� ��������
      if (u >= 0) then // ���-�� �������� ������ ���� ����� � ������ 0
      begin
        WriteLn('');
        WriteLn('������ ������� := ', v);
        WriteLn('������� ������� := ', p div 9);
        WriteLn('�������� := ', u);
        check := true;
      end;
    end;
  end;

  if check = false then
    WriteLn('��� �������');

  Readln;

end.
