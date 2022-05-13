program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TProduct = record
    FType: string[20];
    FCode: Integer;
    FName: string[20];
    FModel: string[20];
    FPrice: Integer;
    FQuantity: Integer;
  end;

  TPElem = ^Elem;
  Elem = record
    FData: TProduct;
    FNext: TPElem;
  end;

  THead = TPElem;

  TFile = file of TProduct;

var
  Head: TPElem;
  FElem: TPElem;
  LFile: TFile;
  LLine: TProduct;
  i: Integer;

procedure Record_Initialize(var AHead: TPElem);
begin
  New(AHead);
  with AHead.FData do
  begin
    FType := '';
    FCode := 0;
    FName := '';
    FModel := '';
    FPrice := 0;
    FQuantity := 0;
  end;
  AHead.FNext := nil;
end;

procedure File_Initialize(var AElem: TPElem; const AHead: TPElem);
var
  N, i, counter: Integer;
  Y: TPElem;
  LFile: File of TProduct;
  AType: string;

begin
  counter := 0;

  AssignFile(LFile, 'ProductsFile');
  Rewrite(LFile);
  CloseFile(LFile);

  New(AElem);
  AHead.FNext := AElem;

  for n := 1 to 4 do
  begin
    case n of
      1:
        AElem.FData.FType := 'Fruits';

      2:
        AElem.FData.FType := 'Vegetables';

      3:
        AElem.FData.FType := 'Meat';

      4:
        AElem.FData.FType := 'Fish';
    end;

    AType := AElem.FData.FType;

    for i := 1 to 30 do
    begin
      with AElem.FData do
      begin
        FName := 'Product' + IntToStr(Random(30));
        FQuantity := Random(50);
        FPrice := Random(100);
        FModel := FType + 's';
        FCode := Random(10000000);
        FType := AType;
      end;

      Y := AElem;
      New(AElem);
      Y^.FNext := AElem;
    end;

  end;
end;

procedure Record_SortByPrice(AHead: TPElem; AType: String);
var
  i: Integer;
  Tmp: TPelem;

begin
  while (AHead.FData.FType <> AType) do
  begin
    AHead := AHead.FNext;
    Tmp := AHead;
  end;


end;

begin
  Record_Initialize(Head);
  File_Initialize(FElem, Head);
  Record_SortByPrice(Head, 'Meat');

  Readln(i);
end.
