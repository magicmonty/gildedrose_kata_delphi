unit ItemBehaviorBase;

interface

uses
  GildedRoseProgram,
  uItem,
  TestFramework;

type
  TTestItems = class
  public
    class function SimpleItem: TItem;
    class function MaturingItem: TItem;
    class function ScalpingItem: TItem;
    class function PristineItem: TItem;
  end;

  TItemBehaviorBase = class(TTestCase)
  protected
    FProgram: TProgram;
    FItem: TItem;

    procedure SetupItem(AItem: TItem);
    procedure SetUp; override;
    procedure TearDown; override;
  end;

implementation

procedure TItemBehaviorBase.Setup;
begin
  FProgram := TProgram.Create;
  FItem := nil;
end;

procedure TItemBehaviorBase.Teardown;
begin
  FProgram.Free;
  FItem.Free;
end;

procedure TItemBehaviorBase.SetupItem(AItem: TItem);
begin
  FItem := AItem;
  FProgram.Items.Add(FItem);
  FProgram.UpdateQuality;
end;

{ TTestItems }

class function TTestItems.MaturingItem: TItem;
begin
  Result := TItem.Create('Aged Brie', 1, 1)
end;

class function TTestItems.PristineItem: TItem;
begin
  Result := TItem.Create('Sulfuras, Hand of Ragnaros', 0, 80);
end;

class function TTestItems.ScalpingItem: TItem;
begin
  Result := TItem.Create(
    'Backstage passes to a TAFKAL80ETC concert',
    1,
    1
  );
end;

class function TTestItems.SimpleItem: TItem;
begin
  Result := TItem.Create('Simple Item', 1, 1);
end;

end.


