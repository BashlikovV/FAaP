Program project1;
{In the eastern calendar of the year, the names of animals are: rat,
 bull, tiger, hare, dragon, snake, horse, sheep, monkey, rooster,
 dog, pig. In addition, every two years the color changes in the
 following order: blue, red, yellow, white, black. Thus, 1992 is
 the year of the black monkey, 1993 is the year of the black rooster,
 1994 is the year of the blue dog, etc. Write a program that translates
 a given year into its name according to the Eastern calendar}

Type
  MasOfAnimals = (Rat, Bull, Tiger, Hare, Dragon, Snake, Horse, Sheep, Monkey,
                  Cock, Dog, Pig);
  MasOfColors = (Blue, Red, Yellow, White, Black);

var

  Year, NumberOfColor, NumberOfAnimal: Integer;
  Name: MasOfAnimals;
  Color: MasOfColors;
  Error: Integer;
  Str: String;

begin

  //Start of the sycle A1
  While (Str <> 'N') do
  Begin

    //Start of the sycle B1
    //Checking the input
    Repeat
      WriteLn('Type the number of year');
      ReadLn(Str);
      val(Str, Year, Error);

      //If year < 0 - error
      if (Year < 0) then Error := 1;
      If (Error <> 0) then Writeln('Incorrect value');

    //End of the cycle B1
    Until (Error = 0);

    //Calculating the number of color
    NumberOfColor := ((((Year + 6) mod 10) + 2) div 2);

    //Calculating the number of animal
    NumberOfAnimal := ((Year + 8) mod 12 + 1);

    //Getting the Color
    case NumberOfColor of
      1: Color := Blue;
      2: Color := Red;
      3: Color :=Yellow;
      4: Color := White;
      5: Color := Black;
    end;

    //Getting the Animal
    case NumberOfAnimal of
      1: Name := Rat;
      2: Name := Bull;
      3: Name := Tiger;
      4: Name := Hare;
      5: Name := Dragon;
      6: Name := Snake;
      7: NAme := Horse;
      8: name := Sheep;
      9: Name := Monkey;
      10: Name := Cock;
      11: Name := Dog;
      12: Name := Pig;
    end;

    Write('Year ', Year, ' of ');

    //Type the Color
    case Color of
      Blue: Write(' Blue ');
      Red: Write(' Red ');
      Yellow: Write(' Yellow ');
      White: Write(' White ');
      Black: Write(' Black ');
    end;

    Write(' ');

    //Type the animal
    case Name of
      Rat: Write(' Rat ');
      Bull: Write(' Bull ');
      Tiger: Write(' Tiger ');
      Hare: Write(' Hare ');
      Dragon: Write(' Dragon ');
      Snake: Write(' Snake ');
      Horse: Write(' Horse ');
      Sheep: Write(' Sheep ');
      Monkey: Write(' Monkey ');
      Cock: Write(' Cock ');
      Dog: Write(' Dog ');
      Pig: Write(' Pig ');
    end;
    WriteLn(#10 ,'Try again?(Y,N)');
    ReadLn(Str);

  //End of the cycle A1
  End;

  readln;

end.
