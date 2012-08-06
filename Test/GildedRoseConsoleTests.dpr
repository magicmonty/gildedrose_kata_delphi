program GildedRoseConsoleTests;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  XmlTestRunner in 'XmlTestRunner.pas',
  ItemBehaviorBase in 'ItemBehaviorBase.pas',
  GildedRoseProgram in '..\GildedRoseProgram.pas',
  SimpleItemTests in 'SimpleItemTests.pas',
  MaturingItemTests in 'MaturingItemTests.pas',
  ScalpingItemTests in 'ScalpingItemTests.pas',
  PristineItemTests in 'PristineItemTests.pas',
  uRetailItem in '..\uRetailItem.pas',
  uItem in '..\uItem.pas',
  uRetailItemFactory in '..\uRetailItemFactory.pas',
  uMaturingItem in '..\uMaturingItem.pas',
  uSimpleItem in '..\uSimpleItem.pas',
  uScalpingItem in '..\uScalpingItem.pas',
  uPristineItem in '..\uPristineItem.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    XmlTestRunner.RunTestsAndClose
  else
    GUITestRunner.RunRegisteredTests;
end.

