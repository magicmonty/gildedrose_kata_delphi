unit ItemBehaviorBase;

interface

uses
  GildedRoseProgram,
  TestFramework;

type
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

end.


