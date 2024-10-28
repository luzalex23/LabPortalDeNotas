unit AlunoDAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, AlunoModel;

type
  TAlunoDAO = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function CriarAluno(Aluno: TAluno): Boolean;
    function LerAluno(Id: Integer): TAluno;
    function AtualizarAluno(Aluno: TAluno): Boolean;
    function DeletarAluno(Id: Integer): Boolean;
  end;

implementation

constructor TAlunoDAO.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TAlunoDAO.CriarAluno(Aluno: TAluno): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC CriarAluno :Nome, :CursoID, :UsuarioID';
    Query.ParamByName('Nome').AsString := Aluno.Nome;
    Query.ParamByName('CursoID').AsInteger := Aluno.Curso.Id;
    Query.ParamByName('UsuarioID').AsInteger := Aluno.Id;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TAlunoDAO.LerAluno(Id: Integer): TAluno;
var
  Query: TFDQuery;
  Aluno: TAluno;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC LerAluno :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.Open;
    if not Query.IsEmpty then
    begin
      Aluno := TAluno.Create(Query.FieldByName('Nome').AsString, '', '', nil);
      Aluno.Id := Query.FieldByName('ID').AsInteger;
      // Preencher outras propriedades conforme necessário
      Result := Aluno;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TAlunoDAO.AtualizarAluno(Aluno: TAluno): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC AtualizarAluno :Id, :Nome, :CursoID, :UsuarioID';
    Query.ParamByName('Id').AsInteger := Aluno.Id;
    Query.ParamByName('Nome').AsString := Aluno.Nome;
    Query.ParamByName('CursoID').AsInteger := Aluno.Curso.Id;
    Query.ParamByName('UsuarioID').AsInteger := Aluno.Id;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TAlunoDAO.DeletarAluno(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC DeletarAluno :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

end.

