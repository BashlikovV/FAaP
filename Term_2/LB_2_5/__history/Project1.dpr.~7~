program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TArray = array of Integer;
  //TArray - тип одномерного массива

  ResultStruct = record
  //ResultStruct - —труктура содержаща€ результаты

    Size: Integer;
    //Size - размер массива

    ArrType: string;
    //ArrType - тип массива

    ExperementalValue_1, ExperementalValue_2: Integer;
    //ExperementalValue_1,_2 - эксперементальное кол-во сравнений

    TheoreticalValue_1, TheoreticalValue_2: Integer;
    //TheoreticalValue_1,_2 - теоретической кол-во сравнений
  end;

var
  ArrayOfSizes: array[1..6] of Integer = (100, 250, 500, 1000, 2000, 3000);
  ArrayOfTypes: array[1..3] of string = ('Random', 'ascending', 'descending');
  ArrayOfResults: array[1..18] of ResultStruct;
  N: Integer;
  FArray_1, FArray_2: TArray;
  Counter, TypesCounter: Integer;
  Comparisons: Integer;
  i: Integer;

  //ArrayOfSizes - массив размеров массивов
  //ArrayOfTypes - массив типов массивов
  //ArrayOfResults - массив результатов
  //N - переменна€ дл€ хранени€ размеров массивов
  //FArray_1, FArray_2 - массивы дл€ сортировок
  //Counter - счетчик дл€ выбора размера массива
  //TypesCounter - счетчик дл€ выбора типа массива
  //Comparisons - счетчик сравнени€
  //i - счетчик цикла

procedure Swap(var AA, AB: Integer);
{ Swap - ѕроцедура обмена двух элементов массива }
var
  Temp: Integer;
  //Temp - переменна€ временного хранени€ значени€
begin
  Temp := AA;
  AA := AB;
  AB := Temp;
end;

procedure Fill(var AArray_1, AArray_2: TArray; AParam: Integer);
{ Fill - ѕроцедура заполнени€ элементов массива в зависимовти от AParam }
//AArray_1, AArray_2 - заполн€емые массивы
//AParam - тип заполнени€
var
  i, k: Integer;
  //i, k - счетчики цикла
begin
  case AParam of

    //«аполнение рандомными числами
    1:
      for i := 0 to Length(AArray_1) do
      begin
        K := Random(100);
        AArray_1[i] := k;
        AArray_2[i] := k;
      end;

    //«аполнение по возрастанию
    2:
      for i := 0 to Length(AArray_1) do
      Begin
        k := i + 1;
        AArray_1[i] := k;
        AArray_2[i] := k;
      End;

    //«аполнение по убыванию
    3:
      for i := 0 to Length(AArray_1) do
      begin
        k := Length(AArray_1) - i;
        AArray_1[i] := k;
        AArray_2[i] := k;
      end;
  end;
end;

procedure FloatingBubble(var AArray: TArray; var AComparisons: Integer);
{ сортировка плавающим пузырьком }
//AArray - сортируемый массив
//AComparisons - количество сравнений
var
  i, k: Integer;
  N: Integer;
  IsSorted: Boolean;

  //i, k - —четчики циклов
  //N - размерность сортируемого массива
  //isSorted - проверка на отсортированность элементов

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
      while (K > 1) and (IsSorted) do
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

procedure SimpleInserts(var AArray: TArray; var AComparisons: Integer);
{ сортировка простыми вставками }
//TArray - сортируемый массив
//AComparisons - количество сравнений
var
  i, j: Integer;
  N: Integer;
  x: Integer;
  //i,j - счетчики циклов
  //N - размерность массива
  //X - переменна€ временного хранени€
begin
  N := Length(AArray);
  i := 1;
  while (i <= N) do
  begin
    x := AArray[i];
    j := i - 1;
    Inc(AComparisons, 2);
    while (j >= 1) and (AArray[j] > x) do
    begin
      AArray[j + 1] := AArray[j];
      j := j - 1;
      AComparisons := AComparisons + 2;
    end;
    AArray[j + 1] := x;
    Inc(i);
  end;
end;

begin
  i := 1;
  TypesCounter := 1;
  while (TypesCounter <= 3) do
  //Ќачало цикла A1 - выбор типа заполнени€ массива
  Begin
    Counter := 1;
    while Counter <= 6 do
    //Ќачало цикл B1 - выбор размера массива
    begin
      SetLength(FArray_1, ArrayOfSizes[Counter]);
      SetLength(FArray_2, ArrayOfSizes[Counter]);
      //”становка размеров массивов FArray_1, FArray_2

      N := ArrayOfSizes[Counter];
      //N - размерность массивов

      Fill(FArray_1, FArray_2, TypesCounter);
      //«аполнение массивов в зависимости от типа

      Comparisons := 0;
      FloatingBubble(FArray_1, Comparisons);
      //¬ыполнение плавающего пузырька и подсчет сравнений

      ArrayOfResults[i].Size := ArrayOfSizes[Counter];
      ArrayOfResults[i].ArrType := ArrayOfTypes[TypesCounter];
      ArrayOfResults[i].ExperementalValue_1 := Comparisons;
      ArrayOfResults[i].TheoreticalValue_1 := (((N*N) + N - 2) div 4);
      //«аполнение полей структуры

      Writeln('Floating Bubble.', ArrayOfResults[i].ArrType, '; Size = ',
        ArrayOfResults[i].Size, #10, 'Comparisons = ',
        ArrayOfResults[i].ExperementalValue_1, #10,
        'Theoretical comparisions = ', ArrayOfResults[i].TheoreticalValue_1, #10);
      //¬ывод результатов

      Comparisons := 0;
      SimpleInserts(FArray_2, Comparisons);
      //¬ыполнение простых вставок и подсчет сравнений

      ArrayOfResults[i].ExperementalValue_2 := Comparisons;
      ArrayOfResults[i].TheoreticalValue_2 := (N * (N - 1)) div 2;
      //«аполнение полей структуры

      Writeln('Simple Inserts.', ArrayOfResults[i].ArrType, '; Size = ',
        ArrayOfResults[i].Size, #10, 'Comparisons = ',
        ArrayOfResults[i].ExperementalValue_2, #10,
        'Theoretical comparisions = ', ArrayOfResults[i].TheoreticalValue_2, #10);
      //¬ывод результатов

      Inc(Counter);
      Inc(i);
    // онец цикла ¬1
    end;

    Inc(TypesCounter);
  //конец цикла ј1
  End;

  Readln;
end.
