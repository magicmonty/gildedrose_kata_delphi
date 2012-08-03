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
  ItemTests in 'ItemTests.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    XmlTestRunner.RunTestsAndClose
  else
    GUITestRunner.RunRegisteredTests;
end.

