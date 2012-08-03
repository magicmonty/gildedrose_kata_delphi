unit GildedRoseProgram;

interface

uses
  Generics.Collections;

type
  TItem = class
  private
    FName: string;
    FSellIn: Integer;
    FQuality: Integer;
  public
    constructor Create(AName: string; ASellIn: Integer; AQuality: Integer);

    property Name: string read FName write FName;
    property SellIn: Integer read FSellIn write FSellIn;
    property Quality: Integer read FQuality write FQuality;
  end;

  TProgram = class
  private
    FItems: TList<TItem>;

    function ItemDegradesInQuality(AItem: TItem): Boolean;
    function ItemMaturesWithTime(AItem: TItem): Boolean;
    function ItemIsScalping(AItem: TItem): Boolean;
    procedure UpdateItemQuality(item: TItem);
    procedure UpdateSellIn(item: TItem);
    procedure UpdateExpiredItemQuality(item: TItem);
  public
    property Items: TList<TItem> read FItems;

    constructor Create;
    destructor Destroy; override;

    procedure UpdateQuality;
  end;

const
  MaxQuality = 50;


implementation

constructor TItem.Create(AName: string; ASellIn, AQuality: Integer);
begin
  inherited Create;
  FName := AName;
  FSellIn := ASellIn;
  FQuality := AQuality;
end;

constructor TProgram.Create;
begin
  inherited Create;
  FItems := TList<TItem>.Create;
end;

destructor TProgram.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TProgram.ItemDegradesInQuality(AItem: TItem): Boolean;
begin
  Result := AItem.Name <> 'Sulfuras, Hand of Ragnaros';
end;

function TProgram.ItemMaturesWithTime(AItem: TItem): Boolean;
begin
  Result := AItem.Name = 'Aged Brie';
end;

function TProgram.ItemIsScalping(AItem: TItem): Boolean;
begin
  Result := AItem.Name = 'Backstage passes to a TAFKAL80ETC concert';
end;

procedure TProgram.UpdateQuality;
var
  item: TItem;
begin
  for item in FItems do
  begin
    UpdateItemQuality(item);
    UpdateSellIn(item);

    if (item.SellIn >= 0) then
      continue;

    UpdateExpiredItemQuality(item);
  end;
end;

procedure TProgram.UpdateItemQuality(item: TItem);
begin
  if ItemMaturesWithTime(item)
  or ItemIsScalping(item) then
  begin
    if (item.Quality < MaxQuality) then
    begin
      item.Quality := item.Quality + 1;
      if ItemIsScalping(item) then
      begin
        if (item.SellIn < 11) and (item.Quality < MaxQuality) then
          item.Quality := item.Quality + 1;
        if (item.SellIn < 6) and (item.Quality < MaxQuality) then
          item.Quality := item.Quality + 1;
      end;
    end;
  end
  else
  begin
    if (item.Quality > 0) and ItemDegradesInQuality(item) then
      item.Quality := item.Quality - 1;
  end;
end;

procedure TProgram.UpdateSellIn(item: TItem);
begin
  if ItemDegradesInQuality(item) then
  begin
    item.SellIn := item.SellIn - 1;
  end;
end;

procedure TProgram.UpdateExpiredItemQuality(item: TItem);
begin
  if ItemMaturesWithTime(item) then
  begin
    if (item.Quality < MaxQuality) then
    begin
      item.Quality := item.Quality + 1;
    end;
  end
  else
  begin
    if ItemIsScalping(item) then
      item.Quality := item.Quality - item.Quality
    else
    begin
      if (item.Quality > 0) and ItemDegradesInQuality(item) then
        item.Quality := item.Quality - 1;
    end;
  end;
end;

end.
