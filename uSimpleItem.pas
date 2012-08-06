unit uSimpleItem;

interface

uses
  uRetailItem;

type
  TSimpleItem = class(TRetailItem)
  protected
    procedure UpdateQuality; override;
    procedure UpdateExpiredQuality; override;
  end;

implementation

procedure TSimpleItem.UpdateQuality;
begin
  DecreaseQualityIfAboveMinimum;
end;

procedure TSimpleItem.UpdateExpiredQuality;
begin
  DecreaseQualityIfAboveMinimum;
end;

end.
