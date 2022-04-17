program Project1;

const
  Eps_1 = 0.0001;
  Eps_2 = 0.00001;
  XFinish = 0.9;

Var
  i: Integer;
  k: Integer;
  numerator, denominator: Real;
  Res: Integer;
  Flag: Boolean;
  Sum, TestSum, Sum0: Real;
  X, Delta: Real;

begin
  X := 0.1;
  Flag := True;
  while X <= XFinish do
  Begin
    k := 1;
    Sum := 0;
    Delta := 0;
    Res := 1;
    while Abs(Delta) <= Eps_2 do
    Begin
      Sum0 := Sum;
      for i := 1 to k do
      Begin
        Res := Res * i;
      End;
      if (k + 1) mod 2 = 0 then
      Begin
        TestSum := 1
      End
      else
      Begin
        TestSum := -1;
      End;
      numerator := (exp(Ln(X) * k)) * TestSum;
      denominator := Res * (k + 1);
      Sum := Sum0 + (numerator / denominator);
      Delta := Sum - Sum0;

      if (Abs(Delta) <= Eps_2) then
      Begin
        WriteLn('X = ', X:6:6, ' Eps_2 = ', Eps_2:6:6, ' Res = ', Sum:6:6, #10);
      End;

      if (Abs(Delta) <= Eps_1) and (Flag) then
      Begin
        WriteLn('X = ', X:6:6, ' Eps_1 = ', Eps_1:6:6, ' Res = ', Sum:6:6);
        Flag := False;
      End;

      Res := 0;
      k := k + 1;
    End;
    X := X + 0.1;
  End;
  ReadLn;

end.
