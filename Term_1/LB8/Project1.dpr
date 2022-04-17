program Project1;
{The matrix X[9,8] is given. Arrange the elements of the matrix
 columns in ascending order, and the columns themselves in ascending
 order of the sums of the rows of elements}

uses
  System.SysUtils;

//Const values
Const
  N = 9;
  M = 8;

//Var values
Var
  Matrix: array[1..N,1..M] of Integer = ((80, 23, 61, 88, 98, 79, 9, 75),       //513 - 7
                                         (92, 13, 58, 60, 43, 92, 36, 84),      //478 - 6
                                         (99, 62, 72, 75, 93, 95, 44, 64),      //604 - 9
                                         (32, 75, 15, 7, 55, 24, 36, 91),       //335 - 2
                                         (10, 77, 15, 25, 40, 90, 35, 30),      //322 - 1
                                         (15, 80, 19, 64, 78, 19, 33, 40),      //348 - 3
                                         (60, 80, 8, 85, 68, 80, 14, 48),       //443 - 4
                                         (94, 88, 19, 52, 63, 33, 10, 86),      //445 - 5
                                         (79, 45, 100, 1, 36, 94, 97, 71));     //523 - 8
  i, j, k, Counter, x: Integer;
  Sum, NextSum: Integer;
  Temp: Integer;

  //Matrix - array[1..N,1..M] of Integer;
  //i - counter of a cycle
  //j - counter of a cycle
  //k - counter of a cycle
  //Counter - counter of a cycle
  //X - value for simple inserts sorting
  //Sum - value for calculating sum for buble sort
  //NextSum - value for calculating sum for buble sort
  //Temp - value for swap procedure

begin

  //Sorting by simple inserts
  //Start of the cycle A1
  for K := 1 to N do
  Begin

    //Start of the cycle B1
    for i := 2 to N do
    Begin
      x := Matrix[k,i];
      j := i - 1;

      //Start of the cycle C1
      while (j >= 1) and (Matrix[k,j] > x) do
      Begin
        Matrix[k,j + 1] := Matrix[k,j];
        j := j - 1;

      //End of the cycle C1
      End;
      Matrix[k,j + 1] := x;
      j := j + 1;

    //End of the cycle B1
    End;

  //End of the cycle A1
  End;

  //Buble sort
  //Start of the cycle A2
  for I := 1 to N  do
  Begin

    //Start of the cycle B2
    for J := I + 1 to N do
    Begin
      Sum := 0;
      NextSum := 0;

      //Caluculating sum
      //Start of the cycle C2
      for Counter := 1 to M do
      Begin
        Sum := Sum + Matrix[i,Counter];
        NextSum := NextSum + Matrix[j,Counter];

      //End of the cycle C2
      End;

      //Checking Sum > NextSum
      if (Sum > NextSum) then
      Begin

        //Swap the elements in the Matrix
        //Start of the cycle C2.2
        for K := 1 to M do
        Begin
          Temp := Matrix[i,k];
          Matrix[i,k] := Matrix[j,k];
          Matrix[j,k] := temp;

        //End of the cycle C2.2
        End
      End;

    //End of the cycle B2
    End;

  //End of the cycle A2
  End;

  //Type sorted matrix
  //Start of the cycle A3
  for I := 1 to N do
  Begin
    Sum := 0;

    //Start of the cycle B3
    for J := 1 to M do
    Begin
      Write(Matrix[i,j]:4);
      Sum := Sum + Matrix[i,j];

    //End of the cycle A3
    End;
    Write('  | ' ,Sum:4);
    WriteLn('', #10);

  //End of the cycle A3
  End;

  ReadLn;

end.
