Program Project1;

Label
  ErrorLabel_1;

var
  Monks, LeadingNumber, SimpleNumber, DiscipleNumber, Cake, LeadingCake,
    DiscipleCake, SimpleCake: real;
  Test: boolean;

begin
ErrorLabel_1:
  Write('���������� ��������� ������� �������� �������: ');
  ReadLn(LeadingCake);
  Write('���������� ��������� ���������-�������� �������: ');
  ReadLn(DiscipleCake);
  Write('���������� ��������� �������� �������� �������: ');
  ReadLn(SimpleCake);
  Write('���������� �������: ');
  ReadLn(Monks);
  Write('���������� �������: ');
  ReadLn(Cake);
  WriteLn('���������� ������� := ', Monks:3:0, ' ���������� ������� := ',
    Cake:3:0);
  Test := false;
  DiscipleNumber := 0;
  while DiscipleNumber <= Monks do
  begin
    SimpleNumber := (Cake + DiscipleNumber * (LeadingCake - DiscipleCake) -
      Monks * LeadingCake) / (SimpleCake - LeadingCake);

    { ���������� ���������� ������� ������� �� ��������� ������� }
    if (SimpleNumber - Int(SimpleNumber) < 0.00000001) and (SimpleNumber >= 0)
    then

    { �������� �������� SimpleNumber }
    begin
      LeadingNumber := Monks - SimpleNumber - DiscipleNumber;

      { ���������� ���������� ������� ������� }
      if LeadingNumber >= 0 then
      begin
        WriteLn('������� ������� := ', LeadingNumber:3:0, ', ������� := ',
          SimpleNumber:3:0, ', �������� := ', DiscipleNumber:3:0);
        Test := true;

        { ����� ��������� ����������� � ��������� ����������� ���������� }
      end;
    end;
    DiscipleNumber := DiscipleNumber + 1;
  end;

  if Test = false then
  begin
    WriteLn('��� �������� ��������: Monks :=', Monks:3:0, ', Cake :=', Cake:3:0,
      ' - ������� ���');
    WriteLn('');
    WriteLn('���������� ��� ���');
    GoTo ErrorLabel_1;

    { ���� ��� ���������� �������� - ������� ��� }
  end;
  ReadLn;

end.
