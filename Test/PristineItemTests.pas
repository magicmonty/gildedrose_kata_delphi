unit PristineItemTests;

interface

uses
  TestFramework,
  GildedRoseProgram,
  ItemBehaviorBase;

type
  TPristineItemTests = class(TItemBehaviorBase)
  published
    procedure APristineShouldNotChangeInQuality;
    procedure APristineShouldNotChangeSellIn;
    procedure AnExpiredPristineShouldNotChangeInQuality;
  end;


implementation

{ TPristineItemTests }

procedure TPristineItemTests.APristineShouldNotChangeInQuality;
begin
  SetupItem(TTestItems.PristineItem);
  CheckEquals(80, FItem.Quality);
end;

procedure TPristineItemTests.APristineShouldNotChangeSellIn;
begin
  SetupItem(TTestItems.PristineItem);
  CheckEquals(0, FItem.SellIn);
end;

procedure TPristineItemTests.AnExpiredPristineShouldNotChangeInQuality;
var
  item: TItem;
begin
  item := TTestItems.PristineItem;
  item.SellIn := -1;
  SetupItem(item);

  CheckEquals(80, FItem.Quality);
end;


initialization
  RegisterTest('', TPristineItemTests.Suite);
end.

