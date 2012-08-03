program GildedRoseConsoleTests;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  {$IFNDEF CONSOLE_TESTRUNNER}
  GUITestRunner,
  {$ELSE}
  XmlTestRunner in 'XmlTestRunner.pas',
  {$ENDIF}
  TestGildedRose in 'TestGildedRose.pas';

{$R *.RES}

begin
  Application.Initialize;
  {$IFDEF CONSOLE_TESTRUNNER}
  XmlTestRunner.RunTestsAndClose;
  {$ELSE}
  GUITestRunner.RunRegisteredTests;
  {$ENDIF}
end.

