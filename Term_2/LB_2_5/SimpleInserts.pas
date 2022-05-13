procedure SimpleInserts(var AArray: TArray; var AComparisons: Integer);
{ ���������� �������� ��������� }
//TArray - ����������� ������
//AComparisons - ���������� ���������
var
  i, j: Integer;
  N: Integer;
  x: Integer;
  //i,j - �������� ������
  //N - ����������� �������
  //X - ���������� ���������� ��������
begin
  N := Length(AArray);
  i := 1;
  while (i <= N) do
  begin
    x := AArray[i];
    j := i - 1;
    Inc(AComparisons, 2);
    while (j >= 0) and (AArray[j] > x) do
    begin
      AArray[j + 1] := AArray[j];
      j := j - 1;
      AComparisons := AComparisons + 2;
    end;
    AArray[j + 1] := x;
    Inc(i);
  end;
end;