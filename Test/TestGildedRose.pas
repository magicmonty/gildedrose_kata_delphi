unit TestGildedRose;

interface

uses
  TestFramework;

type
  TTestGildedRose = class(TTestCase)
  published
    procedure TestTheTruth;
  end;

implementation

procedure TTestGildedRose.TestTheTruth;
begin
  Check(True);
end;

initialization
  RegisterTest('', TTestGildedRose.Suite);
end.


