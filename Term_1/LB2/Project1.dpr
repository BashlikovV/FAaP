Program project1;

Uses
  SysUtils;

Var
  P, Q, S, i, j: Integer;
  Error: Integer;
  TestValue: String;

  {
   P - ��������� ����� P
   Q - ��������� ����� Q
   i - ������� �����, ����������� �������� ��������� ����� Q
   S - ���� ����� �� ������ ��������� �������� 0, � ��������� ������ 1
   j - ������� ����� ������������ ����� P � i �� ��������
   Error - ���������� ����������� �������� 1, ���� ������� �� ������ ��������
   TestValue - ��������� �������� ���������� �����
  }

begin

  //S - ���� = 1, ������ ������ �����
  S := 1;

  //Error �������� �� �������� �� ������ � ������� Val
  Error := 0;

  //�������� �� ������������ ���������� ��������
  Repeat
    Write('������� ����� P: ');
    Readln(TestValue);
    Val(TestValue, P, Error);

    If (P < 0) or (Error <> 0) then
    Begin
      Writeln('Incorrect value');
    End;
  Until (Error = 0) and (P >= 0);

  //�������� �� ������������ ���������� ��������
  Repeat
    Write('������� ����� Q: ');
    Readln(TestValue);
    Val(TestValue, Q, Error);

    If (Q < 0) or (Error <> 0) then
    Begin
      Writeln('Incorrect value');
    End;
  Until (Error = 0) and (Q >= 0);

  // ���� ��������� �������� ����� Q
  for i := 2 to q do
  begin

    // ������� ��� �������� ����� Q
    if q mod i = 0 then
    begin

      // ���� �������� �� �������� ����� P, i
      for j := 2 to round(sqrt(i)) + 1 do
      begin

        // ���� P � I ������� ��� �������, �� ��� ���������
        if (i mod j = 0) and (p mod j = 0) then
          s := 0;
      end;

      // ���� P � i ������� � ��������, �� ��� �������
      if s = 1 then
      begin
        Writeln('�������� ����� ', q, ':= ', i,
          ' - ������� ������� ����� � ������ ', p);
      end;
      s := 1;
    end;
  end;
  Readln;

end.
