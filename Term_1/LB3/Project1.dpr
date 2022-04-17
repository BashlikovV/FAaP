Program Project1;
{Enter n and a sequence B[n] of integers.
 Determine the starting and ending numbers
 of the array elements that make up the
 sequence for which the values of the
 elements are equal to each other.}

//Const Value
Const
  N = 20;

//Var Value
Var
  Mas: array [1..N] of Integer;
  Flag, Stop: Boolean;
  CurrentValue, PreviouValue, NextValue: Integer;
  First, Last: Integer;
  Counter: Integer;
  i: Integer;
  Value: String;
  Error: Integer;

  // Mas - array [1..N] of Integer
  // Flag
  // Stop
  // CurrentValue
  // PreviouValue
  // NextValue
  // First
  // Last
  // Counter
  // I
  // Value
  // Error

Begin

//Start of the sycle C1
for i := 1 to N do
  Begin

    //Start of the sycle C2
    Repeat

      //checking the correctness of the input
      WriteLn('Type Mas[', i, ']: ');
      ReadLn(Value);
      val(Value, Mas[i], Error);
      If (Error <> 0) then
        Writeln('Incorrect value', #10, 'Try again!');

    //End of the cycle C2
    Until (Error = 0);

  //End of the cycle C1
  End;

  i := 2;
  Flag := False;
  Stop := False;

  //Start of the cycle A1
  While (i <= Length(Mas) - 1) do
  Begin

    //Start of the cycle A2
    while ((Flag = False) and (i <= Length(Mas))) do
    Begin

      //Definition of the elements to be compared
      CurrentValue := Mas[i];
      NextValue := Mas[i + 1];
      PreviouValue := Mas[i - 1];

      //Finding the last element of the sequence
      if (CurrentValue = PreviouValue) and
        (Stop = False) then
      Begin
        First := i - 1;
        Stop := True;
      End;
      if ((CurrentValue <> NextValue) or (CurrentValue <> PreviouValue)) and
        (Stop = True) then
      Begin
        if CurrentValue <> NextValue then
        Begin
          Last := i;
        End
        else
        if CurrentValue <> PreviouValue then
        Begin
          Last := i - 1;
        End;


        //Condition for starting the search for new sequences
        if (PreviouValue <> CurrentValue) or (NextValue <> CurrentValue) then
        Begin
          Flag := True;
        End;
      End;
      i := i + 1;

    //End of the cycle A2
    End;
    Flag := False;
    Stop := False;
    Counter := First;

    //Output of a sequence and its start and end numbers
    Write('A sequence of equal numbers: ');
    while COunter <= Last do
    Begin
      Write(Mas[First]);
      Counter := Counter + 1;
    End;
    WriteLn(#10 ,'Number of First in the initial array = ', First, #10,
            'Number of Last in the initial array = ', Last, #10);

  //End of the cycle A1
  End;

  ReadLn;

End.
