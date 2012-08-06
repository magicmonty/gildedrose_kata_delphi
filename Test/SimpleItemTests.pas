unit SimpleItemTests;

interface

uses
  TestFramework,
  GildedRoseProgram,
  uItem,
  ItemBehaviorBase;

type
  TSimpleItemTests = class(TItemBehaviorBase)
  published
    procedure ASimpleItemShouldDegradeInQuality;
    procedure ASimpleItemShouldNotDegradeInQualityBelow0;
    procedure ASimpleItemShouldDecreaseSellIn;
    procedure ASimpleItemShouldFurtherDecreaseSellInIf0;
    procedure ASimpleItemShouldFurtherDecreaseSellInIfBelow0;
    procedure AnExpiredSimpleItemShouldDegradeInQualityTwiceAsFast;
    procedure AnExpiredSimpleItemShouldNotDegradeInQualityBelow0;
  end;

implementation

procedure TSimpleItemTests.ASimpleItemShouldDegradeInQuality;
begin
  SetupItem(TTestItems.SimpleItem);
  CheckEquals(DEFAULT_TEST_QUALITY - 1, FItem.Quality);
end;

procedure TSimpleItemTests.ASimpleItemShouldNotDegradeInQualityBelow0;
var
  item: TItem;
begin
  item := TTestItems.SimpleItem;
  item.Quality := 0;
  SetupItem(item);
  CheckEquals(0, FItem.Quality);
end;

procedure TSimpleItemTests.ASimpleItemShouldDecreaseSellIn;
begin
  SetupItem(TTestItems.SimpleItem);
  CheckEquals(DEFAULT_TEST_SELL_IN - 1, FItem.SellIn);
end;

procedure TSimpleItemTests.ASimpleItemShouldFurtherDecreaseSellInIf0;
var
  item: TItem;
begin
  item := TTestItems.SimpleItem;
  item.SellIn := 0;

  SetupItem(item);
  CheckEquals(-1, FItem.SellIn);
end;

procedure TSimpleItemTests.ASimpleItemShouldFurtherDecreaseSellInIfBelow0;
var
  item: TItem;
begin
  item := TTestItems.SimpleItem;
  item.SellIn := -1;

  SetupItem(item);
  CheckEquals(-2, FItem.SellIn);
end;

procedure TSimpleItemTests.AnExpiredSimpleItemShouldDegradeInQualityTwiceAsFast;
var
  item: TItem;
begin
  item := TTestItems.SimpleItem;
  item.SellIn := -1;

  SetupItem(item);
  CheckEquals(DEFAULT_TEST_QUALITY - 2, FItem.Quality);
end;

procedure TSimpleItemTests.AnExpiredSimpleItemShouldNotDegradeInQualityBelow0;
var
  item: TItem;
begin
  item := TTestItems.SimpleItem;
  item.SellIn := -1;
  item.Quality := 1;

  SetupItem(item);
  CheckEquals(0, FItem.Quality);
end;


initialization
  RegisterTest('', TSimpleItemTests.Suite);
end.
