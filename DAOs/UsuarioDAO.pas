unit UsuarioDAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, UsuarioModel;

type
  TUsuarioDAO = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function CriarUsuario(Usuario: TUsuario): Boolean;
    function LerUsuario(Id: Integer): TUsuario;
    function AtualizarUsuario(Usuario: TUsuario): Boolean;
    function DeletarUsuario(Id: Integer): Boolean;
  end;

implementation

constructor TUsuarioDAO.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TUsuarioDAO.CriarUsuario(Usuario: TUsuario): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC CriarUsuario :Email, :Login, :Senha, :Tipo';
    Query.ParamByName('Email').AsString := Usuario.Email;
    Query.ParamByName('Login').AsString := Usuario.Nome; // Supondo que Login é o Nome
    Query.ParamByName('Senha').AsString := Usuario.Senha;
    Query.ParamByName('Tipo').AsString := 'Tipo'; // Ajuste conforme necessário
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TUsuarioDAO.LerUsuario(Id: Integer): TUsuario;
var
  Query: TFDQuery;
  Usuario: TUsuario;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC LerUsuario :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.Open;
    if not Query.IsEmpty then
    begin
      Usuario := TUsuario.Create(Query.FieldByName('ID').AsInteger,
                                 Query.FieldByName('Nome').AsString,
                                 Query.FieldByName('Email').AsString,
                                 Query.FieldByName('Senha').AsString);
      Result := Usuario;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TUsuarioDAO.AtualizarUsuario(Usuario: TUsuario): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC AtualizarUsuario :Id, :Email, :Login, :Senha, :Tipo';
    Query.ParamByName('Id').AsInteger := Usuario.Id;
    Query.ParamByName('Email').AsString := Usuario.Email;
    Query.ParamByName('Login').AsString := Usuario.Nome; // Supondo que Login é o Nome
    Query.ParamByName('Senha').AsString := Usuario.Senha;
    Query.ParamByName('Tipo').AsString := 'Tipo'; // Ajuste conforme necessário
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TUsuarioDAO.DeletarUsuario(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC DeletarUsuario :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

end.

