unit ProfessorDAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, ProfessorModel;

type
  TProfessorDAO = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function CriarProfessor(Professor: TProfessor): Boolean;
    function LerProfessor(Id: Integer): TProfessor;
    function AtualizarProfessor(Professor: TProfessor): Boolean;
    function DeletarProfessor(Id: Integer): Boolean;
  end;

implementation

constructor TProfessorDAO.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TProfessorDAO.CriarProfessor(Professor: TProfessor): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC CriarProfessor :Nome, :MateriaID, :UsuarioID';
    Query.ParamByName('Nome').AsString := Professor.Nome;
    Query.ParamByName('MateriaID').AsInteger := Professor.Materia.Id;
    Query.ParamByName('UsuarioID').AsInteger := Professor.Id;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TProfessorDAO.LerProfessor(Id: Integer): TProfessor;
var
  Query: TFDQuery;
  Professor: TProfessor;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC LerProfessor :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.Open;
    if not Query.IsEmpty then
    begin
      Professor := TProfessor.Create(Query.FieldByName('Nome').AsString, '', '', nil);
      Professor.Id := Query.FieldByName('ID').AsInteger;
      // Preencher outras propriedades conforme necessário
      Result := Professor;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TProfessorDAO.AtualizarProfessor(Professor: TProfessor): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC AtualizarProfessor :Id, :Nome, :MateriaID, :UsuarioID';
    Query.ParamByName('Id').AsInteger := Professor.Id;
    Query.ParamByName('Nome').AsString := Professor.Nome;
    Query.ParamByName('MateriaID').AsInteger := Professor.Materia.Id;
    Query.ParamByName('UsuarioID').AsInteger := Professor.Id;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TProfessorDAO.DeletarProfessor(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC DeletarProfessor :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

end.

