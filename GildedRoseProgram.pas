unit GildedRoseProgram;

interface

uses
  Generics.Collections,
  uItem,
  uRetailItem,
  uRetailItemFactory;

type
  TProgram = class
  private
    FItems: TList<TItem>;
  public
    property Items: TList<TItem> read FItems;

    constructor Create;
    destructor Destroy; override;

    procedure UpdateQuality;
  end;

implementation

constructor TProgram.Create;
begin
  inherited Create;
  FItems := TList<TItem>.Create;
end;

destructor TProgram.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TProgram.UpdateQuality;
var
  item: TItem;
begin
  for item in FItems do
    TRetailItemFactory.Update(item);
end;

end.
