unit uConjuredItem;

interface

uses
  uSimpleItem;

type
  TConjuredItem = class(TSimpleItem)
  protected
    procedure UpdateQuality; override;
    procedure UpdateExpiredQuality; override;
  end;

implementation

procedure TConjuredItem.UpdateExpiredQuality;
begin
  inherited;
  inherited;
end;

procedure TConjuredItem.UpdateQuality;
begin
  inherited;
  inherited;
end;

end.
