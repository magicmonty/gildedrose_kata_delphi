unit ItemTests;

interface

uses
  TestFramework,
  GildedRoseProgram,
  ItemBehaviorBase;

type
  TItemTests = class(TItemBehaviorBase)
  published
    procedure ASimpleItemShouldDegradeInQuality;
  end;


implementation

procedure TItemTests.ASimpleItemShouldDegradeInQuality;
begin
  SetupItem(TItem.Create('Simple Item', 1, 1));
  CheckEquals(0, FItem.Quality);
end;

initialization
  RegisterTest('', TItemTests.Suite);
end.
