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
  public
    property Items: TList<TItem> read FItems;

    constructor Create;
    destructor Destroy; override;

    procedure UpdateQuality;
  end;



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

procedure TProgram.UpdateQuality;
var
  i: Integer;
begin
  for i := 0 to FItems.Count - 1 do
  begin
    if (FItems[i].Name <> 'Aged Brie') and (FItems[i].Name <> 'Backstage passes to a TAFKAL80ETC concert') then
    begin
      if (FItems[i].Quality > 0) then
      begin
        if (FItems[i].Name <> 'Sulfuras, Hand of Ragnaros') then
        begin
          FItems[i].Quality := FItems[i].Quality - 1;
        end;
      end;
    end
    else
    begin
      if (FItems[i].Quality < 50) then
      begin
        FItems[i].Quality := FItems[i].Quality + 1;

        if (FItems[i].Name = 'Backstage passes to a TAFKAL80ETC concert') then
        begin
          if (FItems[i].SellIn < 11) then
          begin
            if (FItems[i].Quality < 50) then
            begin
              FItems[i].Quality := FItems[i].Quality + 1;
            end;
          end;

          if (FItems[i].SellIn < 6) then
          begin
            if (FItems[i].Quality < 50) then
            begin
              FItems[i].Quality := FItems[i].Quality + 1;
            end;
          end;
        end;
      end;
    end;

    if (FItems[i].Name <> 'Sulfuras, Hand of Ragnaros') then
    begin
      FItems[i].SellIn := FItems[i].SellIn - 1;
    end;

    if (FItems[i].SellIn < 0) then
    begin
      if (FItems[i].Name <> 'Aged Brie') then
      begin
        if (FItems[i].Name <> 'Backstage passes to a TAFKAL80ETC concert') then
        begin
          if (FItems[i].Quality > 0) then
          begin
            if (FItems[i].Name <> 'Sulfuras, Hand of Ragnaros') then
            begin
              FItems[i].Quality := FItems[i].Quality - 1;
            end;
          end;
        end
        else
        begin
          FItems[i].Quality := FItems[i].Quality - FItems[i].Quality;
        end;
      end
      else
      begin
        if (FItems[i].Quality < 50) then
        begin
          FItems[i].Quality := FItems[i].Quality + 1;
        end;
      end;
    end;
  end;
end;

end.
