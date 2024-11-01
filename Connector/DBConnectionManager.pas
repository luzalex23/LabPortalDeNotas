unit DBConnectionManager;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.DApt, System.SysUtils,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef;

type
  TDBConnectionManager = class
  private
    class var FConnection: TFDConnection;
    class procedure ConfigureConnection;
  public
    class function GetConnection: TFDConnection;
  end;

implementation

class procedure TDBConnectionManager.ConfigureConnection;
begin
  FConnection := TFDConnection.Create(nil);
  FConnection.DriverName := 'SQLite';
  FConnection.Params.Values['Database'] := 'C:\Workspace\LabPortalDeNotas\Connector\labportalnotas.db';
  FConnection.LoginPrompt := False;
  FConnection.Connected := True;
end;

class function TDBConnectionManager.GetConnection: TFDConnection;
begin
  if FConnection = nil then
  begin
    ConfigureConnection;
  end;
  Result := FConnection;
end;

end.

