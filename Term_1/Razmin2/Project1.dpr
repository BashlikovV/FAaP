program Project1;

uses SysUtils;

var
  GreenBacteria, RedBacteria, SavedBacteria: Extended;
  i, tact: Integer;
  error: Boolean;
  TestString: String;

Label
  GoToLabel_1, GoToLabel_2;

begin
GoToLabel_2:
  error := False;
  WriteLn('Want to get started?(y/n)');
  ReadLn(TestString);

GoToLabel_1:
  if TestString = 'y' then
  begin
    WriteLn('How many red bacteria?');
    ReadLn(RedBacteria);
    WriteLn('How many green bacteria?');
    ReadLn(GreenBacteria);
    WriteLn('How many tact?');
    ReadLn(tact);

    if (RedBacteria <= 0) or (GreenBacteria <= -1) or (tact <= 0) then
    begin
      error := true;
    end
    else
    begin
      for i := 1 to tact do
      begin
        SavedBacteria := GreenBacteria;
        GreenBacteria := GreenBacteria + RedBacteria;
        RedBacteria := SavedBacteria;

      end;
      WriteLn('For ', tact, ' tact:');
      WriteLn('Quantity of RedBacteria := ', FloatToStr(RedBacteria));
      WriteLn('Quantity of GreenBacteria := ', FloatToStr(GreenBacteria));
      WriteLn('The sum of red and green :=',
        FloatToStr(RedBacteria + GreenBacteria));
    end;

  end
  else if TestString = 'n' then
  begin
    WriteLn('Please, type enter button to exit.');
  end
  else
  begin
    WriteLn('The symbol is unknown. Please, try againe.');
    GoTo GoToLabel_2;
  end;

  if error = true then
  begin
    WriteLn('False values. Please, try again.');
    GoTo GoToLabel_1;
  end;
  ReadLn;

end.
