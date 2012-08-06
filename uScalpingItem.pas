unit uScalpingItem;

interface

uses
  uRetailItem;

type
  TScalpingItem = class(TRetailItem)
  protected
    procedure UpdateQuality; override;
    procedure UpdateExpiredQuality; override;
  end;

implementation

procedure TScalpingItem.UpdateQuality;
begin
  IncreaseQualityIfBelowMaximum;

  if (SellIn < 11) then
    IncreaseQualityIfBelowMaximum;

  if (SellIn < 6) then
    IncreaseQualityIfBelowMaximum;
end;

procedure TScalpingItem.UpdateExpiredQuality;
begin
  Quality := 0
end;

end.
