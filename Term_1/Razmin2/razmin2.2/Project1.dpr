Program Bacteria1;

// Program for counting bacteria using the previous green

{$APPTYPE CONSOLE}

uses
  SysUtils;

// Declaring variables
Var

  RedBacteria, GreenBacteria: Integer;
  PrevGreenB, bacteria: Integer;
  Tacts, I, Error: Integer;
  TestValue: String;

  // RedBacteria - count of red Bacteria,
  // GreenBacteria - count of green Bacteria,
  // Bacteria - count of all Bacteria,
  // Tacts - count of Tacts,
  // I - cycle counter for Tacts,
  // PrevGreenB is the previous value of GreenBacteria,
  // Error - needed to check Errors,
  // TestValue  is needed to validate user input
Begin

  // Set the dedault Error code
  Error := 0;

  // Read GreenBacteria
  Repeat
    Write('Enter a positive number of green Bacteria: ');
    Readln(TestValue);
    Val(TestValue, GreenBacteria, Error);
    If (GreenBacteria < 0) or (Error <> 0) then
      Writeln('Incorrect value');
  Until (Error = 0) and (GreenBacteria >= 0);

  // Read RedBacteria
  Repeat
    Write('Enter a positive number of  red Bacteria: ');
    Readln(TestValue);
    Val(TestValue, RedBacteria, Error);
    If (RedBacteria < 0) or (Error <> 0) then
      Writeln('Incorrect value');
  Until (Error = 0) and (RedBacteria >= 0);

  // Read Tacts
  Repeat
    Write('Enter a positive number of Tacts: ');
    Readln(TestValue);
    Val(TestValue, Tacts, Error);
    If (Tacts < 1) or (Error <> 0) then
      Writeln('Incorrect value');
  Until (Error = 0) and (Tacts >= 1);

  // Set default values
  PrevGreenB := GreenBacteria;

  // Start of the cycle A1
  // Cycle calculates the number of each Bacteria
  I := 1;

  While (I <= Tacts) do
  Begin

    // Green Bacteria count is the previous number of all
      GreenBacteria := GreenBacteria + RedBacteria;

      // Red Bacteria count is the previous number of green
      RedBacteria := PrevGreenB;

    // Saving the current number of green Bacteria
    PrevGreenB := GreenBacteria;

    // Incrementing I
    I := I + 1;
  End;
  // End of the cycle A1

  // If Integer values out of bounds then
  If (GreenBacteria < 0) or (GreenBacteria + RedBacteria <= 0)
  then
  Begin
    Writeln('This program cannot calculate Bacteria with',
    'your parameters because of the inteteger max bound.',
    ' These are the highest values that are correct ');
  End;

  If (GreenBacteria >= 0) and (GreenBacteria + RedBacteria > 0)
  then
  Begin

    // Print results
    bacteria := GreenBacteria + RedBacteria;
    Writeln('Bacteria = ', bacteria, '; Green Bacteria = ', GreenBacteria,
      '; red bacteria = ', RedBacteria, '; tacts = ', Tacts);
  End;
  Readln;
End.
