unit uItem;

interface

type
  TItem = class
  strict private
    FName: string;
    FSellIn: Integer;
    FQuality: Integer;
  public
    constructor Create(AName: string; ASellIn: Integer; AQuality: Integer);

    property Name: string read FName write FName;
    property SellIn: Integer read FSellIn write FSellIn;
    property Quality: Integer read FQuality write FQuality;
  end;


implementation

constructor TItem.Create(AName: string; ASellIn, AQuality: Integer);
begin
  inherited Create;
  FName := AName;
  FSellIn := ASellIn;
  FQuality := AQuality;
end;

end.

