program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TMatrix = array [1..3,1..3] of Integer;

var
  Matrix_1, Matrix_2: TMatrix;
  TmpMatrix_1, TmpMatrix_2: TMatrix;
  X: Integer;
  Expression: string;

procedure MtrInput(ProcMatrix: TMatrix);
var
  i, j, Error: Integer;
  Str: String;
begin
  Writeln('Enter the elements of Matrix: ');
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
    begin
      Repeat
        Writeln('Element [', i, ',', j, ']');
        Readln(Str);
        Val(Str,ProcMatrix[i,j],Error);
        If Error <> 0 then
        Begin
          Writeln('You haven not entered a number rightnow,');
          Writeln('just keep entering numbers further.');
        End;
      Until Error = 0;
      Writeln;
    end;
  end;
end;

procedure MtrOutput(ProcMatrix: Tmatrix);
var
  i, j: Integer;
begin
  WriteLn('Matrix: ');
  for i := 1 to 3 do begin
    for j := 1 to 3 do begin
      write(ProcMatrix[i,j]:4);
    end;
    Writeln(#10);
  end;
end;

procedure MtrSum(ResMatrix: TMatrix; ProcMatrix_1: TMatrix;
                 ProcMatrix_2: TMatrix);
var
  i, j: Integer;
begin
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
    begin
      ResMatrix[i,j] := ProcMatrix_1[i,j] + ProcMatrix_2[i,j];
    end;
  end;
end;

procedure MtrSub(ResMatrix: TMatrix; ProcMatrix_1: TMatrix;
                 ProcMatrix_2: TMatrix);
var
  i, j: Integer;
begin
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
    begin
      ResMatrix[i,j] := ProcMatrix_1[i,j] - ProcMatrix_2[i,j];
    end;
  end;
end;

procedure MtrMultip(ResMatrix: TMatrix; ProcMatrix_1: TMatrix;
                    ProcMatrix_2: TMatrix);
var
  i, j, k: Integer;
begin
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
    begin
      ResMatrix[i,j] := 0;
      for k := 1 to 3 do
      begin
        ResMatrix[i,j] := ResMatrix[i,j] + ProcMatrix_1[i,k]*ProcMatrix_2[k,j];
      end;
    end;
  end;
end;

procedure NumMultip(ResMatrix: TMatrix; ProcMatrix: Tmatrix; x: Integer);
var
  i,j: Integer;
begin
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
    begin
      ResMatrix[i,j] := 0;
      ResMatrix[i,j] := ProcMatrix[i,j] * x;
    end;
  end;
end;

begin
  Writeln('Enter first Matrix: ');
  MtrInput(Matrix_1);
  Writeln('Your first Matrix: ');
  MtrOutput(Matrix_1);

  Writeln('Enter second matrix: ');
  MtrInput(Matrix_2);
  Writeln('Your second matrix: ');
  MtrOutput(Matrix_2);

  MtrSum(TmpMatrix_1, Matrix_1, Matrix_2);
  MtrMultip(TmpMatrix_1, TmpMatrix_1, Matrix_1);

  NumMultip(TmpMatrix_2, Matrix_1, 2);


  {(A + B)*A - B*(2*A + 3*B)}
  Readln;
end.
