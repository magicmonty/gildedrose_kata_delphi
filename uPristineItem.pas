unit uPristineItem;

interface

uses
  uRetailItem;

type
  TPristineItem = class(TRetailItem)
  protected
    procedure UpdateQuality; override;
    procedure UpdateSellIn; override;
    procedure UpdateExpiredQuality; override;
  end;

implementation

procedure TPristineItem.UpdateExpiredQuality;
begin
end;

procedure TPristineItem.UpdateQuality;
begin
end;

procedure TPristineItem.UpdateSellIn;
begin
end;

end.
