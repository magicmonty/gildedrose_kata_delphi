program GildedRose;

{$APPTYPE CONSOLE}

uses
  SysUtils;

begin
  try
  { TODO -oEntwickler -cKonsole Main : Hier Code einfügen }
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
