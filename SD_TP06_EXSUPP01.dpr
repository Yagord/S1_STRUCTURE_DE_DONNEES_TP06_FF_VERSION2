program SD_TP06_EXSUPP01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit_SD_TP06_EXSUPP01 in 'Unit_SD_TP06_EXSUPP01.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insérer du code ici }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
