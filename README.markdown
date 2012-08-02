*Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:*

- All items have a `SellIn` value which denotes the number of days we have to sell the item
- All items have a `Quality` value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item

*Pretty simple, right? Well this is where it gets interesting:*

- Once the sell by date has passed, `Quality` degrades twice as fast
- The `Quality` of an item is never negative
- "Aged Brie" actually increases in `Quality` the older it gets
- The `Quality` of an item is never more than 50
- "Sulfuras", being a legendary item, never has to be sold or decreases in `Quality`
- "Backstage passes", like aged brie, increases in `Quality` as it's `SellIn` value approaches; `Quality` increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but `Quality` drops to 0 after the concert

*We have recently signed a supplier of conjured items. This requires an update to our system:*

- "Conjured" items degrade in `Quality` twice as fast as normal items

*Feel free to make any changes to the `UpdateQuality` method and add any new code as long as everything still works correctly. However, do not alter the `TItem` class or `Items` property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code ownership (you can make the `UpdateQuality` method and `Items` property static if you like, we'll cover for you). Your work needs to be completed by Friday, February 18, 2011 08:00:00 AM PST.*

Just for clarification, an item can never have its `Quality` increase above 50, however "Sulfuras" is a legendary item and as such its `Quality` is 80 and it never alters.

    procedure TProgram.UpdateQuality;
    var
      i: Integer;
    begin
      for i := 0 to FItems.Count - 1 do
      begin
        if (FItems[i].Name <> 'Aged Brie') and (FItems[i].Name <> 'Backstage passes to a TAFKAL80ETC concert') then
        begin
          if (FItems[i].Quality > 0) then
          begin
            if (FItems[i].Name <> 'Sulfuras, Hand of Ragnaros') then
            begin
              FItems[i].Quality := FItems[i].Quality - 1;
            end;
          end;
        end
        else
        begin
          if (FItems[i].Quality < 50) then
          begin
            FItems[i].Quality := FItems[i].Quality + 1;
    
            if (FItems[i].Name = 'Backstage passes to a TAFKAL80ETC concert') then
            begin
              if (FItems[i].SellIn < 11) then
              begin
                if (FItems[i].Quality < 50) then
                begin
                  FItems[i].Quality := FItems[i].Quality + 1;
                end;
              end;
    
              if (FItems[i].SellIn < 6) then
              begin
                if (FItems[i].Quality < 50) then
                begin
                  FItems[i].Quality := FItems[i].Quality + 1;
                end;
              end;
            end;
          end;
        end;
    
        if (FItems[i].Name <> 'Sulfuras, Hand of Ragnaros') then
        begin
          FItems[i].SellIn := FItems[i].SellIn - 1;
        end;
    
        if (FItems[i].SellIn < 0) then
        begin
          if (FItems[i].Name <> 'Aged Brie') then
          begin
            if (FItems[i].Name <> 'Backstage passes to a TAFKAL80ETC concert') then
            begin
              if (FItems[i].Quality > 0) then
              begin
                if (FItems[i].Name <> 'Sulfuras, Hand of Ragnaros') then
                begin
                  FItems[i].Quality := FItems[i].Quality - 1;
                end;
              end;
            end
            else
            begin
              FItems[i].Quality := FItems[i].Quality - FItems[i].Quality;
            end;
          end
          else
          begin
            if (FItems[i].Quality < 50) then
            begin
              FItems[i].Quality := FItems[i].Quality + 1;
            end;
          end;
        end;
      end;
    end;
    
    TItem = class
    private
      FName: string;
      FSellIn: Integer;
      FQuality: Integer;
    public
      constructor Create(AName: string; ASellIn: Integer; AQuality: Integer);
    
      property Name: string read FName write FName;
      property SellIn: Integer read FSellIn write FSellIn;
      property Quality: Integer read FQuality write FQuality;
    end;
