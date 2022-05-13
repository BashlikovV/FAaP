program LB_8;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TMatrix = array of array of Integer;
  //TMatrix - тип двухмерный массив

var
  FMatrix: TMatrix;
  FFile: Text;

  //FMatrix - двухмерный массив
  //FFile - текстовый файл

procedure Matrix_Initialize(var AMatrix: TMatrix);
{ процедура инициализации динамического массива }
begin
  SetLength(AMatrix, 5, 6);
  AMatrix[0, 4] := 1;
end;

procedure PTriangle_Create(var AMatrix: TMatrix);
{ Процедура создания указанного в условии треугольника Паскаля }
var
  i, j: Integer;
  //i, j - Счетчики циклов для заполнения матрицы

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
{ процедура инициализации текстового файла }
begin
  Assign(AFile, 'Pascal');
  //Инициализация переменной и привязка к файлу

  Rewrite(AFile);
  //Создание и открытие файла
end;

procedure TextFile_MakePascal(var AFile: Text; AMatrix: TMatrix);
{ процедура записи треугольника Паскаля в файл }
var
  i, j: Integer;
  //i, j - счетчики цикла

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
{ процедура закрытия файла }
begin
  Close(AFile);
end;

begin
  PTriangle_Create(FMatrix);
  TextFile_Create(FFile);
  TextFile_MakePascal(FFile, FMatrix);
  TextFile_Close(FFile);
end.
