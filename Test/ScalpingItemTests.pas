unit ScalpingItemTests;

interface

uses
  TestFramework,
  GildedRoseProgram,
  uItem,
  ItemBehaviorBase;

type
  TScalpingItemTests = class(TItemBehaviorBase)
  published
    procedure AScalpingItemShouldIncreaseInQuality;
    procedure AScalpingItemShouldNeverIncreaseInQualityAboveMaxQuality;
    procedure AScalpingItemShouldDoubleIncreaseQualityIfSellInLessThan11;
    procedure AScalpingItemShouldTripleIncreaseQualityIfSellInLessThan6;
    procedure AScalpingItemShouldDecreaseSellIn;
    procedure AScalpingItemShouldFurtherDecreaseSellInIf0;
    procedure AnExpiredScalpingItemShouldDropQualityTo0;
  end;


implementation

uses
  uRetailItem;

procedure TScalpingItemTests.AScalpingItemShouldIncreaseInQuality;
var
  item: TItem;
begin
  item := TTestItems.ScalpingItem;
  item.SellIn := 20;

  SetupItem(item);
  CheckEquals(DEFAULT_TEST_QUALITY + 1, FItem.Quality);
end;

procedure TScalpingItemTests.AScalpingItemShouldNeverIncreaseInQualityAboveMaxQuality;
var
  item: TItem;
begin
  item := TTestItems.ScalpingItem;
  item.Quality := MaxQuality;
  SetupItem(item);
  CheckEquals(MaxQuality, FItem.Quality);
end;

procedure TScalpingItemTests.AScalpingItemShouldDoubleIncreaseQualityIfSellInLessThan11;
var
  item: TItem;
begin
  item := TTestItems.ScalpingItem;
  item.SellIn := 10;

  SetupItem(item);
  CheckEquals(DEFAULT_TEST_QUALITY + 2, FItem.Quality);
end;

procedure TScalpingItemTests.AScalpingItemShouldTripleIncreaseQualityIfSellInLessThan6;
var
  item: TItem;
begin
  item := TTestItems.ScalpingItem;
  item.SellIn := 5;

  SetupItem(item);
  CheckEquals(DEFAULT_TEST_QUALITY + 3, FItem.Quality);
end;

procedure TScalpingItemTests.AScalpingItemShouldDecreaseSellIn;
var
  item: TItem;
begin
  item := TTestItems.ScalpingItem;

  SetupItem(item);
  CheckEquals(DEFAULT_TEST_SELL_IN - 1, FItem.SellIn);
end;

procedure TScalpingItemTests.AScalpingItemShouldFurtherDecreaseSellInIf0;
var
  item: TItem;
begin
  item := TTestItems.ScalpingItem;
  item.SellIn := -1;

  SetupItem(item);
  CheckEquals(-2, FItem.SellIn);
end;

procedure TScalpingItemTests.AnExpiredScalpingItemShouldDropQualityTo0;
var
  item: TItem;
begin
  item := TTestItems.ScalpingItem;
  item.SellIn := 0;

  SetupItem(item);
  CheckEquals(0, FItem.Quality);
end;


initialization
  RegisterTest('', TScalpingItemTests.Suite);
end.
