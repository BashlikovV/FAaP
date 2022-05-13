﻿  i := 1;
  TypesCounter := 1;
  while (TypesCounter <= 3) do
  //Начало цикла A1 - выбор типа заполнения массива
  Begin
    Counter := 1;
    while Counter <= 6 do
    //Начало цикл B1 - выбор размера массива
    begin
      SetLength(FArray_1, ArrayOfSizes[Counter]);
      SetLength(FArray_2, ArrayOfSizes[Counter]);
      //Установка размеров массивов FArray_1, FArray_2

      N := ArrayOfSizes[Counter];
      //N - размерность массивов

      Fill(FArray_1, FArray_2, TypesCounter);
      //Заполнение массивов в зависимости от типа

      Comparisons := 0;
      FloatingBubble(FArray_1, Comparisons);
      //Выполнение плавающего пузырька и подсчет сравнений

      ArrayOfResults[i].Size := ArrayOfSizes[Counter];
      ArrayOfResults[i].ArrType := ArrayOfTypes[TypesCounter];
      ArrayOfResults[i].ExperementalValue_1 := Comparisons;
      ArrayOfResults[i].TheoreticalValue_1 := (((N*N) + N - 2) div 4);
      //Заполнение полей структуры

      Writeln('Floating Bubble.', ArrayOfResults[i].ArrType, '; Size = ',
        ArrayOfResults[i].Size, #10, 'Comparisons = ',
        ArrayOfResults[i].ExperementalValue_1, #10,
        'Theoretical comparisions = ', ArrayOfResults[i].TheoreticalValue_1, #10);
      //Вывод результатов

      Comparisons := 0;
      SimpleInserts(FArray_2, Comparisons);
      //Выполнение простых вставок и подсчет сравнений

      ArrayOfResults[i].ExperementalValue_2 := Comparisons;
      ArrayOfResults[i].TheoreticalValue_2 := (N * (N - 1)) div 2;
      //Заполнение полей структуры

      Writeln('Simple Inserts.', ArrayOfResults[i].ArrType, '; Size = ',
        ArrayOfResults[i].Size, #10, 'Comparisons = ',
        ArrayOfResults[i].ExperementalValue_2, #10,
        'Theoretical comparisions = ', ArrayOfResults[i].TheoreticalValue_2, #10);
      //Вывод результатов

      Inc(Counter);
      Inc(i);
    //Конец цикла В1
    end;

    Inc(TypesCounter);
  //конец цикла А1
  End;

  Readln;