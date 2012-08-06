program GildedRose;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  uItem,
  GildedRoseProgram in 'GildedRoseProgram.pas',
  uMaturingItem in 'uMaturingItem.pas',
  uPristineItem in 'uPristineItem.pas',
  uRetailItem in 'uRetailItem.pas',
  uRetailItemFactory in 'uRetailItemFactory.pas',
  uScalpingItem in 'uScalpingItem.pas',
  uSimpleItem in 'uSimpleItem.pas',
  uConjuredItem in 'uConjuredItem.pas';

var
  app: TProgram;

begin
  try
    Writeln('OMGHAI!');

    app := TProgram.Create;
    try
      app.Items.Add(TItem.Create('+5 Dexterity Vest', 10, 20));
      app.Items.Add(TItem.Create('Aged Brie', 2, 0));
      app.Items.Add(TItem.Create('Elixir of the Mongoose', 5, 7));
      app.Items.Add(TItem.Create('Sulfuras, Hand of Ragnaros', 0, 80));
      app.Items.Add(
        TItem.Create(
          'Backstage passes to a TAFKAL80ETC concert',
          15,
          20
        )
      );
      app.Items.Add(TItem.Create('Conjured Mana Cake', 3, 6));
      app.UpdateQuality();

      Readln;
    finally
      app.Free;
    end;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
