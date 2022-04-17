program Zd4;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  LongNum=Array[1..100] of Integer;
  TCompareRez = (Equally, More, Less);
var
  nb,nrez,i:Integer;
  b,rez: LongNum;

//Функция определяет длинну числа
function GetN(a:LongNum; n:Integer = 1):Integer;
var
  i:Integer;
begin
  for i := 101-n to 100 do
  if (a[i] <> 0)then  //Нашли отличную от 0 цифру - здесь и начинается число
  begin
    GetN:=101-i ;
    Exit;
  end;
  GetN:=0;
end;

//Число равное 0
function Zero:LongNum;
var
  rez:LongNum;
  i:Integer ;
begin
    for i := 1 to 100 do
      rez[i]:=0;
    Zero:=rez;
end;

//Ввод числа
function EnterNum (out n:Integer ) : LongNum;
var
  s:String;
  i:Integer;
  rez:LongNum;
begin
  Readln(s);
  rez:=Zero;
  for i := 1  to  length(s)   do
    rez[100-length(s)+i]:= strtoint(s[i]);  //В массив число в носим в конец
  n:= GetN(rez,length(s));                  //Длину числа получаем из функции
  EnterNum:=rez;
end;

function Compare (a,b:LongNum; na,nb:Integer):TCompareRez;
var
  i:Integer;
begin
  if na>nb then
    Compare:=More
  else if na<nb then
    Compare:=Less
  else
  begin
    for i:= 101-na to 100 do
      if a[i] > b[i] then
      begin
        Compare:=More;
        Exit;
      end
      else if a[i] < b[i] then
      begin
        Compare:=Less;
        Exit;
      end;
    Compare:=Equally;
  end
end;

function Add(a,b:LongNum; na,nb:Integer; out nrez:Integer):LongNum;
var
  n,i,c:Integer;
  rez:LongNum;
begin
  rez:=Zero;

  //Длина результата равна длине большего оеранда и, можт быть, +1
  if na>=nb then
    n:=na
  else
    n:=nb;

  for i := 100 downto 101-n do
  begin
    c:=rez[i]+a[i]+b[i];       //c= перенос + цифра первого операнда + цифра воторого операнда
    rez[i]:= c mod 10;         //Значение разряда
    rez[i-1]:=  c div 10;      // Перенос
  end;


 // Возможно необходимо увеличит длину на 1 (перенос в последем разряде)
 if rez[100-n] <> 0 then
    nrez:= n+1
 else
    nrez:=n;
 Add:=rez;
end;

function Min(a,b:LongNum; na,nb:Integer; out nrez:Integer):LongNum;
var
  n,i,c:Integer;
  rez:LongNum;
begin
  rez:=Zero();

  n:=na;

  for i := 100 downto 101-n do
  begin
    c:=a[i]-b[i]+rez[i];            //В с сразу учитываем заём
    if c< 0 then                    //Если разность отрицательная необходим заём
    begin
      rez[i]:=  (10+c);             //В разряд декущий записываем 10 + разность
      rez[i-1]:=-1;                 //От следующего отнимаем 1
    end
    else
      rez[i]:=  c;                  //Если положительная - просто прибавляем к разряду
  end;

  nrez:=GetN(rez,n);                //Длина из функции - она может быть любой
  Min:=rez;
end;

function Multiply(a,b:LongNum; na,nb:Integer; out nrez:Integer):LongNum;
var
  i,j,c,n:Integer;
  rez,t:LongNum ;
begin
    rez:=Zero;
    t:=Zero;
    n:=0;

  for i:= 100 downto 101-nb do      //Закрепяем цифру множимого
    for j:= 100 downto 101-na do    //Закрепляем цифру множителя
    begin
       c:=a[j]*b[i];
       t[j+i-100]:=c mod 10;        //t[100-(100-i)-(100-j)] - Смещение с учётом обоих операндов
       t[j+i-100-1]:=c div 10;
       rez:= Add(rez,t,n,102-(j+i-100),n);  //Слаживаем не полное произведение с рзультатм для предыдущей цифры
       t:=Zero;
    end;

  //Определяем длину результата
  if rez[101-n] <> 0 then
    nrez:= n
  else
    nrez:=n-1 ;
  Multiply:=rez;
end;

function Divide (a,b:LongNum; na,nb:Integer; out nrez:Integer):LongNum;
var
  i,n,nprez,tempn:Integer;
  prez,t,rez:LongNum ;
  x:TCompareRez;
begin
  t:=Zero;
  prez:=Zero;
  nrez:=0;
  rez:=Zero;
  n:=0;


  // Записываем в переменную prez первые цифры из переменной а,
  //    в количестве = длинне переменной b
  for i:=n to n+nb-1 do
    prez[101-nb+i-n]:=a[101-na+i-n];
  nprez:=nb;
  n:=n+nb;

  repeat
  begin
    // Если число получилось меньше чем b, то дописывае в КОНЕЦ ещё 1 символ
    if ((Compare(prez,Zero,nprez,nprez) <> Equally) and (n<>na)) and (Compare(prez,b,nprez,nb) = Less) then
    begin
      for i:= 101-nb to 100 do            //Смещаем все цифры влево
        prez[i-1]:=prez[i];
      prez[100]:=a[101-na+n];            //Дописывем
      nprez:=nprez+1;
      nrez:=nrez+1;
      rez[nrez]:=0;
      n:=n+1
    end;

    // Перебираем все цифры, чтобы найти ту, при умножении на которую а, получим
    //  число большее prez. Эта цифра будет или равна или на 1 больше цифры частного
    for i:=0 to 10 do
    begin
      t[100]:=i;
      t:=Multiply(b,t,nb,1,tempn);

      x:= Compare(t,prez,tempn,nprez);
      if (x <> Less) then                 //Если b*i>=prez
      begin
        nrez:=nrez+1;                     //Увеличиваем длину результата
        if x = More then                  //Если получили больше, то очередная цифра результата на 1 меньше i
        begin
          rez[nrez]:=i-1;
          prez:= Min(prez,Min(t,b,tempn,nb,tempn),nprez,tempn,nprez)  //Дальше работаем с разностью prez и b*(i-1) (b*i-b=t-b)
        end
        else
        begin                             //Если b*i=prez, то очередная цифра результата равна i
          rez[nrez]:=i;
          prez:=Min(prez,t,nprez,tempn,nprez)                         //Дальше работаем с разностью prez и b*i
        end;
        break;
      end //if (x <> Less)
    end;//for i:=1 to 10 do

    //Перемещаем цифры рабочего числа(prez) и дописываем следуюшую цифру a
    for i:= 101-nb to 100 do
      prez[i-1]:=prez[i];
    prez[100]:=a[101-na+n];
    nprez:=nprez+1;
    n:=n+1
  end;
  until n > na;

  // Перемещаем цифры результата в конец массива rez
  for i:=1 to nrez do
  begin
    rez[100-nrez+i]:=rez[i];
    rez[i]:=0;
  end;
  Divide:=rez;

  //Определяем длину результата
  if rez[101-nrez] <> 0 then
    nrez:= nrez
  else
    nrez:=nrez-1 ;
end;

begin
  Write('Vvedite 1 chislo: ');
  a:=EnterNum(na);

  Write('Operator (+,-,*,/): ');
  Readln(op);

  Write('Vvedite 2 chislo: ');
  b:=EnterNum(nb);

  case op of
    '-':rez:=Min(a,b,na,nb,nrez);
    '+':rez:=Add(a,b,na,nb,nrez);
    '*':rez:=Multiply(a,b,na,nb,nrez);
    '/':rez:=Divide(a,b,na,nb,nrez)
  else
    rez:=Zero
  end;

  Write('Rezultat: ');
  for i := 101-nrez to 100 do
    Write(rez[i]);
  Readln;
end.
 