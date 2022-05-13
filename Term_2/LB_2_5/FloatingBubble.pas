procedure FloatingBubble(var AArray: TArray; var AComparisons: Integer);
{ ���������� ��������� ��������� }
//AArray - ����������� ������
//AComparisons - ���������� ���������
var
  i, k: Integer;
  N: Integer;
  IsSorted: Boolean;

  //i, k - �������� ������
  //N - ����������� ������������ �������
  //isSorted - �������� �� ����������������� ���������

begin
  IsSorted := False;
  N := Length(AArray);

  for i := 0 to N - 1 do
  begin
    If (AArray[i] > AArray[i + 1]) then
    begin
      Swap(AArray[i], AArray[i + 1]);
      k := i;
      IsSorted := True;
      while (K > 0) and (IsSorted) do
      begin
        if (AArray[k - 1] > AArray[k]) then
        begin
          Swap(AArray[k - 1], AArray[k]);
          Dec(K);
          Inc(AComparisons);
        end
        else IsSorted := False;
      end;
    end;
    Inc(AComparisons);
  end;
end;