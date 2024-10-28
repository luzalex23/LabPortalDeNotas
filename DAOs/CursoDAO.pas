unit CursoDAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, CursoModel;

type
  TCursoDAO = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function CriarCurso(Curso: TCurso): Boolean;
    function LerCurso(Id: Integer): TCurso;
    function AtualizarCurso(Curso: TCurso): Boolean;
    function DeletarCurso(Id: Integer): Boolean;
  end;

implementation

constructor TCursoDAO.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TCursoDAO.CriarCurso(Curso: TCurso): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC CriarCurso :Nome';
    Query.ParamByName('Nome').AsString := Curso.Nome;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TCursoDAO.LerCurso(Id: Integer): TCurso;
var
  Query: TFDQuery;
  Curso: TCurso;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC LerCurso :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.Open;
    if not Query.IsEmpty then
    begin
      Curso := TCurso.Create(Query.FieldByName('ID').AsInteger, Query.FieldByName('Nome').AsString);
      Result := Curso;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TCursoDAO.AtualizarCurso(Curso: TCurso): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC AtualizarCurso :Id, :Nome';
    Query.ParamByName('Id').AsInteger := Curso.Id;
    Query.ParamByName('Nome').AsString := Curso.Nome;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TCursoDAO.DeletarCurso(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC DeletarCurso :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

end.

