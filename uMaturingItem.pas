unit uMaturingItem;

interface

uses
  uRetailItem;

type
  TMaturingItem = class(TRetailItem)
  protected
    procedure UpdateQuality; override;
    procedure UpdateExpiredQuality; override;
  end;

implementation

procedure TMaturingItem.UpdateQuality;
begin
  IncreaseQualityIfBelowMaximum;
end;

procedure TMaturingItem.UpdateExpiredQuality;
begin
  IncreaseQualityIfBelowMaximum;
end;

end.
