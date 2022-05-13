unit Algorithms;

interface
type
  TArray = array of Integer;
  //TArray - ��� ����������� �������

  ResultStruct = record
  //ResultStruct - ��������� ���������� ����������

    Size: Integer;
    //Size - ������ �������

    ArrType: string;
    //ArrType - ��� �������

    ExperementalValue_1, ExperementalValue_2: Integer;
    //ExperementalValue_1,_2 - ����������������� ���-�� ���������

    TheoreticalValue_1, TheoreticalValue_2: Integer;
    //TheoreticalValue_1,_2 - ������������� ���-�� ���������
  end;

  procedure Swap(var AA, AB: Integer);
  procedure Fill(var AArray_1, AArray_2: TArray; AParam: Integer);
  procedure FloatingBubble(var AArray: TArray; var AComparisons: Integer);
  procedure SimpleInserts(var AArray: TArray; var AComparisons: Integer);

implementation

procedure Swap(var AA, AB: Integer);
{ Swap - ��������� ������ ���� ��������� ������� }
var
  Temp: Integer;
  //Temp - ���������� ���������� �������� ��������
begin
  Temp := AA;
  AA := AB;
  AB := Temp;
end;

procedure Fill(var AArray_1, AArray_2: TArray; AParam: Integer);
{ Fill - ��������� ���������� ��������� ������� � ����������� �� AParam }
//AArray_1, AArray_2 - ����������� �������
//AParam - ��� ����������
var
  i, k: Integer;
  //i, k - �������� �����
begin
  case AParam of

    //���������� ���������� �������
    1:
      for i := 0 to Length(AArray_1) do
      begin
        K := Random(3000);
        AArray_1[i] := k;
        AArray_2[i] := k;
      end;

    //���������� �� �����������
    2:
      for i := 0 to Length(AArray_1) do
      Begin
        k := i + 1;
        AArray_1[i] := k;
        AArray_2[i] := k;
      End;

    //���������� �� ��������
    3:
      for i := 0 to Length(AArray_1) do
      begin
        k := Length(AArray_1) - i;
        AArray_1[i] := k;
        AArray_2[i] := k;
      end;
  end;
end;

{$I FloatingBubble}
//FloatingBubble.pas - ���� ���������� ������������ ���������� ���������

{$I SimpleInserts}
//SimpleInserts.pas - ���� ���������� ������������ ���������� �������� ���������

end.
