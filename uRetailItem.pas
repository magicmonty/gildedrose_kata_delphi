unit uRetailItem;

interface

uses
  uItem;

type
  IRetailItem = interface
    procedure Update;
  end;

  TRetailItem = class(TInterfacedObject, IRetailItem)
  private
    FItem: TItem;
    function GetName: string;
    procedure SetName(const Value: string);
    function GetQuality: Integer;
    function GetSellIn: Integer;
    procedure SetQuality(const Value: Integer);
    procedure SetSellIn(const Value: Integer);
  protected
    procedure UpdateQuality; virtual; abstract;
    procedure UpdateSellIn; virtual;
    procedure UpdateExpiredQuality; virtual; abstract;

    function IsExpired: Boolean;
    function QualityIsAboveMinimum: Boolean;
    procedure DecreaseQualityIfAboveMinimum;
    function QualityIsBelowMaximum: Boolean;
    procedure IncreaseQualityIfBelowMaximum;
  public
    property Name: string read GetName write SetName;
    property SellIn: Integer read GetSellIn write SetSellIn;
    property Quality: Integer read GetQuality write SetQuality;

    constructor Create(const AItem: TItem);

    procedure Update;
  end;

const
  MaxQuality = 50;

implementation

constructor TRetailItem.Create(const AItem: TItem);
begin
  inherited Create;
  FItem := AItem;
end;

function TRetailItem.GetName: string;
begin
  Result := FItem.Name;
end;

procedure TRetailItem.SetName(const Value: string);
begin
  FItem.Name := Value;
end;

function TRetailItem.GetQuality: Integer;
begin
  Result := FItem.Quality;
end;

procedure TRetailItem.SetQuality(const Value: Integer);
begin
  FItem.Quality := Value;
end;

function TRetailItem.GetSellIn: Integer;
begin
  Result := FItem.SellIn;
end;

procedure TRetailItem.SetSellIn(const Value: Integer);
begin
  FItem.SellIn := Value;
end;

function TRetailItem.QualityIsAboveMinimum: Boolean;
begin
  Result := Quality > 0;
end;

procedure TRetailItem.DecreaseQualityIfAboveMinimum;
begin
  if QualityIsAboveMinimum then
    Quality := Quality - 1;
end;

function TRetailItem.QualityIsBelowMaximum: Boolean;
begin
  Result := Quality < MaxQuality;
end;

procedure TRetailItem.IncreaseQualityIfBelowMaximum;
begin
  if QualityIsBelowMaximum then
    Quality := Quality + 1;
end;

function TRetailItem.IsExpired: Boolean;
begin
  Result := SellIn < 0;
end;

procedure TRetailItem.Update;
begin
  UpdateQuality;
  UpdateSellIn;

  if IsExpired then
    UpdateExpiredQuality;
end;

procedure TRetailItem.UpdateSellIn;
begin
  SellIn := SellIn - 1;
end;

end.
