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

//������� ���������� ������ �����
function GetN(a:LongNum; n:Integer = 1):Integer;
var
  i:Integer;
begin
  for i := 101-n to 100 do
  if (a[i] <> 0)then  //����� �������� �� 0 ����� - ����� � ���������� �����
  begin
    GetN:=101-i ;
    Exit;
  end;
  GetN:=0;
end;

//����� ������ 0
function Zero:LongNum;
var
  rez:LongNum;
  i:Integer ;
begin
    for i := 1 to 100 do
      rez[i]:=0;
    Zero:=rez;
end;

//���� �����
function EnterNum (out n:Integer ) : LongNum;
var
  s:String;
  i:Integer;
  rez:LongNum;
begin
  Readln(s);
  rez:=Zero;
  for i := 1  to  length(s)   do
    rez[100-length(s)+i]:= strtoint(s[i]);  //� ������ ����� � ����� � �����
  n:= GetN(rez,length(s));                  //����� ����� �������� �� �������
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

  //����� ���������� ����� ����� �������� ������� �, ���� ����, +1
  if na>=nb then
    n:=na
  else
    n:=nb;

  for i := 100 downto 101-n do
  begin
    c:=rez[i]+a[i]+b[i];       //c= ������� + ����� ������� �������� + ����� �������� ��������
    rez[i]:= c mod 10;         //�������� �������
    rez[i-1]:=  c div 10;      // �������
  end;


 // �������� ���������� �������� ����� �� 1 (������� � �������� �������)
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
    c:=a[i]-b[i]+rez[i];            //� � ����� ��������� ���
    if c< 0 then                    //���� �������� ������������� ��������� ���
    begin
      rez[i]:=  (10+c);             //� ������ ������� ���������� 10 + ��������
      rez[i-1]:=-1;                 //�� ���������� �������� 1
    end
    else
      rez[i]:=  c;                  //���� ������������� - ������ ���������� � �������
  end;

  nrez:=GetN(rez,n);                //����� �� ������� - ��� ����� ���� �����
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

  for i:= 100 downto 101-nb do      //��������� ����� ���������
    for j:= 100 downto 101-na do    //���������� ����� ���������
    begin
       c:=a[j]*b[i];
       t[j+i-100]:=c mod 10;        //t[100-(100-i)-(100-j)] - �������� � ������ ����� ���������
       t[j+i-100-1]:=c div 10;
       rez:= Add(rez,t,n,102-(j+i-100),n);  //��������� �� ������ ������������ � ��������� ��� ���������� �����
       t:=Zero;
    end;

  //���������� ����� ����������
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


  // ���������� � ���������� prez ������ ����� �� ���������� �,
  //    � ���������� = ������ ���������� b
  for i:=n to n+nb-1 do
    prez[101-nb+i-n]:=a[101-na+i-n];
  nprez:=nb;
  n:=n+nb;

  repeat
  begin
    // ���� ����� ���������� ������ ��� b, �� ��������� � ����� ��� 1 ������
    if ((Compare(prez,Zero,nprez,nprez) <> Equally) and (n<>na)) and (Compare(prez,b,nprez,nb) = Less) then
    begin
      for i:= 101-nb to 100 do            //������� ��� ����� �����
        prez[i-1]:=prez[i];
      prez[100]:=a[101-na+n];            //���������
      nprez:=nprez+1;
      nrez:=nrez+1;
      rez[nrez]:=0;
      n:=n+1
    end;

    // ���������� ��� �����, ����� ����� ��, ��� ��������� �� ������� �, �������
    //  ����� ������� prez. ��� ����� ����� ��� ����� ��� �� 1 ������ ����� ��������
    for i:=0 to 10 do
    begin
      t[100]:=i;
      t:=Multiply(b,t,nb,1,tempn);

      x:= Compare(t,prez,tempn,nprez);
      if (x <> Less) then                 //���� b*i>=prez
      begin
        nrez:=nrez+1;                     //����������� ����� ����������
        if x = More then                  //���� �������� ������, �� ��������� ����� ���������� �� 1 ������ i
        begin
          rez[nrez]:=i-1;
          prez:= Min(prez,Min(t,b,tempn,nb,tempn),nprez,tempn,nprez)  //������ �������� � ��������� prez � b*(i-1) (b*i-b=t-b)
        end
        else
        begin                             //���� b*i=prez, �� ��������� ����� ���������� ����� i
          rez[nrez]:=i;
          prez:=Min(prez,t,nprez,tempn,nprez)                         //������ �������� � ��������� prez � b*i
        end;
        break;
      end //if (x <> Less)
    end;//for i:=1 to 10 do

    //���������� ����� �������� �����(prez) � ���������� ��������� ����� a
    for i:= 101-nb to 100 do
      prez[i-1]:=prez[i];
    prez[100]:=a[101-na+n];
    nprez:=nprez+1;
    n:=n+1
  end;
  until n > na;

  // ���������� ����� ���������� � ����� ������� rez
  for i:=1 to nrez do
  begin
    rez[100-nrez+i]:=rez[i];
    rez[i]:=0;
  end;
  Divide:=rez;

  //���������� ����� ����������
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
 