unit ConjuredItemTests;

interface

uses
  TestFramework,
  GildedRoseProgram,
  uItem,
  ItemBehaviorBase;

type
  TConjuredItemTests = class(TItemBehaviorBase)
  published
    procedure AConjuredItemShouldDegradeInQualityTwiceAsFast;
    procedure AConjuredItemShouldNotDegradeInQualityBelow0;
    procedure AConjuredItemShouldDecreaseSellIn;
    procedure AConjuredItemShouldFurtherDecreaseSellInIf0;
    procedure AConjuredItemShouldFurtherDecreaseSellInIfBelow0;
    procedure AnExpiredConjuredItemShouldDegradeInQualityFourTimesAsFast;
    procedure AnExpiredConjuredItemShouldNotDegradeInQualityBelow0;
  end;

implementation

procedure TConjuredItemTests.AConjuredItemShouldDegradeInQualityTwiceAsFast;
begin
  SetupItem(TTestItems.ConjuredItem);
  CheckEquals(DEFAULT_TEST_QUALITY - 2, FItem.Quality);
end;

procedure TConjuredItemTests.AConjuredItemShouldNotDegradeInQualityBelow0;
var
  item: TItem;
begin
  item := TTestItems.ConjuredItem;
  item.Quality := 0;
  SetupItem(item);
  CheckEquals(0, FItem.Quality);
end;

procedure TConjuredItemTests.AConjuredItemShouldDecreaseSellIn;
begin
  SetupItem(TTestItems.ConjuredItem);
  CheckEquals(DEFAULT_TEST_SELL_IN - 1, FItem.SellIn);
end;

procedure TConjuredItemTests.AConjuredItemShouldFurtherDecreaseSellInIf0;
var
  item: TItem;
begin
  item := TTestItems.ConjuredItem;
  item.SellIn := 0;

  SetupItem(item);
  CheckEquals(-1, FItem.SellIn);
end;

procedure TConjuredItemTests.AConjuredItemShouldFurtherDecreaseSellInIfBelow0;
var
  item: TItem;
begin
  item := TTestItems.ConjuredItem;
  item.SellIn := -1;

  SetupItem(item);
  CheckEquals(-2, FItem.SellIn);
end;

procedure TConjuredItemTests.AnExpiredConjuredItemShouldDegradeInQualityFourTimesAsFast;
var
  item: TItem;
begin
  item := TTestItems.ConjuredItem;
  item.SellIn := -1;

  SetupItem(item);
  CheckEquals(DEFAULT_TEST_QUALITY - 4, FItem.Quality);
end;

procedure TConjuredItemTests.AnExpiredConjuredItemShouldNotDegradeInQualityBelow0;
var
  item: TItem;
begin
  item := TTestItems.ConjuredItem;
  item.SellIn := -1;
  item.Quality := 1;

  SetupItem(item);
  CheckEquals(0, FItem.Quality);
end;


initialization
  RegisterTest('', TConjuredItemTests.Suite);
end.
