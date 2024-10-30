unit DBConnectionManager;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.DApt, System.SysUtils;

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
  FConnection.DriverName := 'ODBC';
  FConnection.Params.Values['ODBCDriver'] := 'ODBC Driver 17 for SQL Server';
  FConnection.Params.Values['Server'] := 'localhost';
  FConnection.Params.Values['Database'] := 'labportalnotas';
  FConnection.Params.Values['User_Name'] := 'sa';
  FConnection.Params.Values['Password'] := 'root12345';
  FConnection.Params.Values['Port'] := '1433';
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

