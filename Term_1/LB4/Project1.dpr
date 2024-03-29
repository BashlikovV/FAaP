program LBR_4;
{In an array S of dimension N x N, the elements
 of the first column and the first row are given.
 Calculate all the elements of the array so that
 each element located on the diagonal D would be
 equal to the first element of the diagonal D.
 (Consider diagonals parallel to the main diagonal)}

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

//Const values
Const
  N = 10;
  //N - number of array elements

//Var values
var
  i, j: Integer;
  S: array [1..N,1..N] of Integer;
  {i, j - cycle counters
   S - two-dimensional array of dimension NxN }

begin

  {filling the first row and the first column
   with random elements and start of the cycle A1 }
  for i := 1 to N do
  begin

    //Start of the cycle A2
    for j := 1 to N do
    begin

      //Checking j = 0 or i = 0
      if (j = 1) or (i = 1) then
      begin
        S[i,j] := Random(9999);
      end;

    //The end of the cycle A2
    end;
    j := 0;

  //The end of the cycle A1
  end;

  {filling in array elements parallel to the main
   diagonal and start of the cycle B1 }
  for i := 2 to N do
  Begin

    //�illing in array elements under the main diagonal
    S[i,j] := S[i - 1,j - 1];

     //Start of the cycle B2
     for j := 2 to N do
     Begin

       //�illing in array elements over the main diagonal
       S[i,j] := S[i - 1,j - 1];

     //The end of the cycle B2
     End;

     M := N - 1;
  //The end of the cycle B1
  End;

  {output of the final array to the console}
  i := 1;
  j := 1;
  WriteLn('��������� ������: ');

  {start of the C1 cycle that outputs the results
   to the console }
  while (i <= N) do
  begin

    //Start of the cycle C2
    while (j <= N) do
    Begin

      //Output of array elements
      Write(S[i,j]:6, ' ');
      j := j + 1;

    //The end of the cycle �2
    End;
    j := 1;
    i := i + 1;

    //Output of array elements
    WriteLn(' ' + #10);

  //The end of the cycle �1
  end;

  ReadLn;
end.
