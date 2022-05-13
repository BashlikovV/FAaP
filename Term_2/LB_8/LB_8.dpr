program LB_8;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TMatrix = array of array of Integer;
  //TMatrix - ��� ���������� ������

var
  FMatrix: TMatrix;
  FFile: Text;

  //FMatrix - ���������� ������
  //FFile - ��������� ����

procedure Matrix_Initialize(var AMatrix: TMatrix);
{ ��������� ������������� ������������� ������� }
begin
  SetLength(AMatrix, 5, 6);
  AMatrix[0, 4] := 1;
end;

procedure PTriangle_Create(var AMatrix: TMatrix);
{ ��������� �������� ���������� � ������� ������������ ������� }
var
  i, j: Integer;
  //i, j - �������� ������ ��� ���������� �������

begin
  Matrix_Initialize(AMatrix);

  for i := 1 to High(AMatrix) do
  begin
    for j := Length(AMatrix) - 1 downto 0 do
    begin
      AMatrix[i, j] := AMatrix[i - 1, j] + AMatrix[i - 1, j + 1];
    end;
  end;
end;

procedure TextFile_Create(var AFile: Text);
{ ��������� ������������� ���������� ����� }
begin
  Assign(AFile, 'Pascal');
  //������������� ���������� � �������� � �����

  Rewrite(AFile);
  //�������� � �������� �����
end;

procedure TextFile_MakePascal(var AFile: Text; AMatrix: TMatrix);
{ ��������� ������ ������������ ������� � ���� }
var
  i, j: Integer;
  //i, j - �������� �����

begin
  i := 0;
  j := 0;
  while (i <= 4) and (j <= 5) do
  begin
    if (j <> 5) then write(AFile, AMatrix[i, j]:3);;

    if (j = 5) then
    begin
      write(AFile, #10);
      Inc(i);
      j := -1;
    end;
    Inc(j);
  end;
end;

procedure TextFile_Close(var AFile: Text);
{ ��������� �������� ����� }
begin
  Close(AFile);
end;

begin
  PTriangle_Create(FMatrix);
  TextFile_Create(FFile);
  TextFile_MakePascal(FFile, FMatrix);
  TextFile_Close(FFile);
end.
