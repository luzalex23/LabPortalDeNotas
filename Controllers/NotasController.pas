unit NotasController;

interface

uses
  NotasDAO, NotasModel, System.SysUtils, Data.DB;

type
  TNotasController = class
  private
    FNotasDAO: TNotasDAO;
  public
    constructor Create(ANotasDAO: TNotasDAO);
    function LancaNotas(Nota: TNota): Boolean;
    function ConsultaNotasAluno(AlunoId: Integer): TDataSet;
    function VerificaPendenciasAprovacao(AlunoId, MateriaId: Integer): Double;
  end;

implementation

constructor TNotasController.Create(ANotasDAO: TNotasDAO);
begin
  FNotasDAO := ANotasDAO;
end;

function TNotasController.LancaNotas(Nota: TNota): Boolean;
begin
  if Nota.Aluno = nil then
    raise Exception.Create('A nota deve estar associada a um aluno.');

  if Nota.Materia = nil then
    raise Exception.Create('A nota deve estar associada a uma matéria.');

  if (Nota.Valor < 0) or (Nota.Valor > 10) then
    raise Exception.Create('O valor da nota deve estar entre 0 e 10.');

  Result := FNotasDAO.LancaNotas(Nota);
end;

function TNotasController.ConsultaNotasAluno(AlunoId: Integer): TDataSet;
begin
  Result := FNotasDAO.ConsultaNotasAluno(AlunoId);
end;

function TNotasController.VerificaPendenciasAprovacao(AlunoId, MateriaId: Integer): Double;
begin
  Result := FNotasDAO.VerificaPendenciasAprovacao(AlunoId, MateriaId);
end;

end.

