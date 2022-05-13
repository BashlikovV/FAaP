program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Algorithms in 'Algorithms.pas';
  //Algorithms - подключаемый модуль с подпрограммами

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
  //N - переменная для хранения размеров массивов
  //FArray_1, FArray_2 - массивы для сортировок
  //Counter - счетчик для выбора размера массива
  //TypesCounter - счетчик для выбора типа массива
  //Comparisons - счетчик сравнения
  //i - счетчик цикла

begin
  {$I ResInput.pas}
  //ResInput.pas - файл содержащий код вывода резуультатов
end.
