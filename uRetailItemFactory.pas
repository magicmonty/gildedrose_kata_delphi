unit uRetailItemFactory;

interface

uses
  uItem,
  uRetailItem;

type

  TRetailItemFactory = class
  private
    class function ItemIsPristine(const AItem: TItem): Boolean;
    class function ItemMaturesWithTime(const AItem: TItem): Boolean;
    class function ItemIsScalping(const AItem: TItem): Boolean;
    class function ItemIsConjured(const AItem: TItem): Boolean;
    class function Create(const AItem: TItem): IRetailItem;
  public
    class procedure Update(const AItem: TItem);
  end;

implementation

uses
  uSimpleItem,
  uMaturingItem,
  uScalpingItem,
  uPristineItem,
  uConjuredItem;

class function TRetailItemFactory.Create(const AItem: TItem): IRetailItem;
begin
  if ItemMaturesWithTime(AItem) then
    Result := TMaturingItem.Create(AItem)
  else if ItemIsScalping(AItem) then
    Result := TScalpingItem.Create(AItem)
  else if ItemIsPristine(AItem) then
    Result := TPristineItem.Create(AItem)
  else if ItemIsConjured(AItem) then
    Result := TConjuredItem.Create(AItem)
  else
    Result := TSimpleItem.Create(AItem);
end;

class function TRetailItemFactory.ItemIsConjured(const AItem: TItem): Boolean;
begin
  Result := Pos('Conjured', AItem.Name) > 0;
end;

class function TRetailItemFactory.ItemIsPristine(
  const AItem: TItem): Boolean;
begin
  Result := AItem.Name = 'Sulfuras, Hand of Ragnaros';
end;

class function TRetailItemFactory.ItemIsScalping(const AItem: TItem): Boolean;
begin
  Result := Pos('Backstage passes', AItem.Name) = 1;
end;

class function TRetailItemFactory.ItemMaturesWithTime(
  const AItem: TItem): Boolean;
begin
  Result := AItem.Name = 'Aged Brie';
end;

class procedure TRetailItemFactory.Update(const AItem: TItem);
begin
  TRetailItemFactory.Create(AItem).Update;
end;

end.
