unit NotasDAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, NotasModel;

type
  TNotasDAO = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function LancaNotas(Nota: TNota): Boolean;
    function ConsultaNotasAluno(AlunoId: Integer): TDataSet;
    function VerificaPendenciasAprovacao(AlunoId, MateriaId: Integer): Double;
  end;

implementation

constructor TNotasDAO.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TNotasDAO.LancaNotas(Nota: TNota): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC LancaNotas :AlunoId, :MateriaId, :Unidade1, :Unidade2, :Unidade3, :Unidade4';
    Query.ParamByName('AlunoId').AsInteger := Nota.Aluno.Id;
    Query.ParamByName('MateriaId').AsInteger := Nota.Materia.Id;
    Query.ParamByName('Unidade1').AsFloat := Nota.Valor; // Ajuste conforme necessário
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TNotasDAO.ConsultaNotasAluno(AlunoId: Integer): TDataSet;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC ConsultaNotasAluno :AlunoId';
    Query.ParamByName('AlunoId').AsInteger := AlunoId;
    Query.Open;
    Result := Query;
  except
    Query.Free;
    raise;
  end;
end;

function TNotasDAO.VerificaPendenciasAprovacao(AlunoId, MateriaId: Integer): Double;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC VerificaPendenciasAprovacao :AlunoId, :MateriaId';
    Query.ParamByName('AlunoId').AsInteger := AlunoId;
    Query.ParamByName('MateriaId').AsInteger := MateriaId;
    Query.Open;
    Result := Query.FieldByName('PontosFaltantes').AsFloat;
  finally
    Query.Free;
  end;
end;

end.

