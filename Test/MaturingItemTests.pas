unit MaturingItemTests;

interface

uses
  TestFramework,
  GildedRoseProgram,
  uItem,
  ItemBehaviorBase;

type
  TMaturingItemTests = class(TItemBehaviorBase)
  published
    procedure AMaturingItemShouldIncreaseInQuality;
    procedure AMaturingItemShouldNeverIncreaseInQualityAboveMaxQuality;
    procedure AMaturingItemShouldDecreaseSellIn;
    procedure AMaturingItemShouldFurtherDecreaseSellInIf0;
    procedure AnExpiredMaturingItemShouldIncreaseInQualityTwiceAsFast;
    procedure AnExpiredMaturingItemShouldNotIncreaseInQualityAboveMaxQuality;
  end;

implementation

uses
  uRetailItem;

procedure TMaturingItemTests.AMaturingItemShouldIncreaseInQuality;
begin
  SetupItem(TTestItems.MaturingItem);
  CheckEquals(2, FItem.Quality);
end;

procedure TMaturingItemTests.AMaturingItemShouldNeverIncreaseInQualityAboveMaxQuality;
var
  item: TItem;
begin
  item := TTestItems.MaturingItem;
  item.Quality := uRetailItem.MaxQuality;
  SetupItem(item);
  CheckEquals(uRetailItem.MaxQuality, FItem.Quality);
end;

procedure TMaturingItemTests.AMaturingItemShouldDecreaseSellIn;
var
  item: TItem;
begin
  item := TTestItems.MaturingItem;
  item.SellIn := 0;

  SetupItem(item);
  CheckEquals(-1, FItem.SellIn);
end;

procedure TMaturingItemTests.AMaturingItemShouldFurtherDecreaseSellInIf0;
var
  item: TItem;
begin
  item := TTestItems.MaturingItem;
  item.SellIn := -1;

  SetupItem(item);
  CheckEquals(-2, FItem.SellIn);
end;

procedure TMaturingItemTests.AnExpiredMaturingItemShouldIncreaseInQualityTwiceAsFast;
var
  item: TItem;
begin
  item := TTestItems.MaturingItem;
  item.SellIn := -1;

  SetupItem(item);
  CheckEquals(3, FItem.Quality);
end;

procedure TMaturingItemTests.AnExpiredMaturingItemShouldNotIncreaseInQualityAboveMaxQuality;
var
  item: TItem;
begin
  item := TTestItems.MaturingItem;
  item.SellIn := -1;
  item.Quality := 49;

  SetupItem(item);
  CheckEquals(50, FItem.Quality);
end;

initialization
  RegisterTest('', TMaturingItemTests.Suite);
end.
