unit Algorithms;

interface
type
  TArray = array of Integer;
  //TArray - тип одномерного массива

  ResultStruct = record
  //ResultStruct - Структура содержащая результаты

    Size: Integer;
    //Size - размер массива

    ArrType: string;
    //ArrType - тип массива

    ExperementalValue_1, ExperementalValue_2: Integer;
    //ExperementalValue_1,_2 - эксперементальное кол-во сравнений

    TheoreticalValue_1, TheoreticalValue_2: Integer;
    //TheoreticalValue_1,_2 - теоретической кол-во сравнений
  end;

  procedure Swap(var AA, AB: Integer);
  procedure Fill(var AArray_1, AArray_2: TArray; AParam: Integer);
  procedure FloatingBubble(var AArray: TArray; var AComparisons: Integer);
  procedure SimpleInserts(var AArray: TArray; var AComparisons: Integer);

implementation

procedure Swap(var AA, AB: Integer);
{ Swap - Процедура обмена двух элементов массива }
var
  Temp: Integer;
  //Temp - переменная временного хранения значения
begin
  Temp := AA;
  AA := AB;
  AB := Temp;
end;

procedure Fill(var AArray_1, AArray_2: TArray; AParam: Integer);
{ Fill - Процедура заполнения элементов массива в зависимовти от AParam }
//AArray_1, AArray_2 - заполняемые массивы
//AParam - тип заполнения
var
  i, k: Integer;
  //i, k - счетчики цикла
begin
  case AParam of

    //Заполнение рандомными числами
    1:
      for i := 0 to Length(AArray_1) do
      begin
        K := Random(3000);
        AArray_1[i] := k;
        AArray_2[i] := k;
      end;

    //Заполнение по возрастанию
    2:
      for i := 0 to Length(AArray_1) do
      Begin
        k := i + 1;
        AArray_1[i] := k;
        AArray_2[i] := k;
      End;

    //Заполнение по убыванию
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
//FloatingBubble.pas - файл содержащий подпрограмму сортировки пузырьком

{$I SimpleInserts}
//SimpleInserts.pas - файл содержащий подпрограмму сортировки простыми вставками

end.
