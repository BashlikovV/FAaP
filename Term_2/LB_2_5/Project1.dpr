program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Algorithms in 'Algorithms.pas';
  //Algorithms - ������������ ������ � ��������������

var
  ArrayOfSizes: array[1..6] of Integer = (100, 250, 500, 1000, 2000, 3000);
  ArrayOfTypes: array[1..3] of string = ('Random', 'ascending', 'descending');
  ArrayOfResults: array[1..18] of ResultStruct;
  N: Integer;
  FArray_1, FArray_2: TArray;
  Counter, TypesCounter: Integer;
  Comparisons: Integer;
  i: Integer;

  //ArrayOfSizes - ������ �������� ��������
  //ArrayOfTypes - ������ ����� ��������
  //ArrayOfResults - ������ �����������
  //N - ���������� ��� �������� �������� ��������
  //FArray_1, FArray_2 - ������� ��� ����������
  //Counter - ������� ��� ������ ������� �������
  //TypesCounter - ������� ��� ������ ���� �������
  //Comparisons - ������� ���������
  //i - ������� �����

begin
  {$I ResInput.pas}
  //ResInput.pas - ���� ���������� ��� ������ ������������
end.
