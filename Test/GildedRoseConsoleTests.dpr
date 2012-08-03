program GildedRoseConsoleTests;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TestGildedRose in 'TestGildedRose.pas',
  XmlTestRunner in 'XmlTestRunner.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    XmlTestRunner.RunTestsAndClose
  else
    GUITestRunner.RunRegisteredTests;
end.

