Program Project1;
{ For given function calculate results with different Eps }

// Const values
Const
  Eps1 = 0.0001;
  Eps2 = 0.00001;
  XMax = 0.9;
  Xh = 0.1;
  // Eps1 - The first epsilon
  // Eps2 - The second epsilon
  // XMax – Maximum value to x
  // Xh – Step to x

// Var values
Var
  F, X, F0, D, numerator, denominator, Sum: real;
  k, i, TestSum, Res: integer;
  Flag: Boolean;
  // F - The result of the function
  // X - Argument of the function
  // F0 - The value in the process
  // Numerator - the numerator of the fraction
  // Denominator - the denimerator of the fraction
  // D - Difference beetwen F and F0
  // K - Counter of function
  // I - The parameter of the cycles
  // TestSum - choice 1 or -1
  // Res - factorial calculation
  // Flag - Boolean for correct output

Begin
  // Assignment start value
  X := 0.1;

  // Start A1 cycle by X
  while X <= XMax do
  begin
    // Preparing for next cycle
    Flag := True;
    Denominator := 0;
    numerator := 0;
    Res := 0;
    k := 1;
    F := 0;
    d := 0;
    F0 := 0;
    Sum := Eps1 + 1;

    // Start A2 cycle by d value
    While Abs(Sum) > Eps2 do
    Begin
      Res := 1;
      // Start of B1 cycle by I
      for i := 1 to k do
      begin
        Res := Res * i;
      end;
      // End of B1 cycle

      if (k + 1) mod 2 = 0 then
        TestSum := 1
      else
        TestSum := -1;

      // Calcultation of element in process
      numerator := (exp(Ln(X) * k)) * TestSum;
      denominator := Res * (k + 1);
      Sum := (numerator / denominator);

      F := F + Sum;

      // Display results by the first epsilon
      if ((Abs(Sum) < Eps1) and (Flag)) then
      begin
        Writeln('X=', X:4:1, ' F=', F:15:12, ' K=', k, ' Eps=', Eps1:8:4);

        // And make no more displaying of this
        Flag := False;
      end;

      // Modify the number of iteration
      k := k + 1;
    End;
    // End of A2 cycle

    // Display results by the second epsilon
    Writeln('X=', X:4:1, ' F=', F:15:12, ' K=', k, ' Eps=', Eps2:8:5, #10);

    // Increment X
    X := X + Xh;
  end;
  // End of A1 cycle

  Readln;

end.
