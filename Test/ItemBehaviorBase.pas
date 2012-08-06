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
    class function ConjuredItem: TItem;
  end;

  TItemBehaviorBase = class(TTestCase)
  protected
    FProgram: TProgram;
    FItem: TItem;

    procedure SetupItem(AItem: TItem);
    procedure SetUp; override;
    procedure TearDown; override;
  end;

const DEFAULT_TEST_QUALITY: Integer = 10;
const DEFAULT_TEST_SELL_IN: Integer = 20;

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

{$region 'TTestItems'}
class function TTestItems.ConjuredItem: TItem;
begin
  Result := TItem.Create('Conjured Mana Cake', DEFAULT_TEST_SELL_IN, DEFAULT_TEST_QUALITY);
end;

class function TTestItems.MaturingItem: TItem;
begin
  Result := TItem.Create('Aged Brie', DEFAULT_TEST_SELL_IN, DEFAULT_TEST_QUALITY)
end;

class function TTestItems.PristineItem: TItem;
begin
  Result := TItem.Create('Sulfuras, Hand of Ragnaros', 0, 80);
end;

class function TTestItems.ScalpingItem: TItem;
begin
  Result := TItem.Create(
    'Backstage passes to a TAFKAL80ETC concert',
    DEFAULT_TEST_SELL_IN,
    DEFAULT_TEST_QUALITY
  );
end;

class function TTestItems.SimpleItem: TItem;
begin
  Result := TItem.Create('Simple Item', DEFAULT_TEST_SELL_IN, DEFAULT_TEST_QUALITY);
end;
{$endregion 'TTestItems'}

end.


