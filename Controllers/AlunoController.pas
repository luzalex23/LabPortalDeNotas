unit AlunoController;

interface

uses
  AlunoDAO, AlunoModel, System.SysUtils, Data.DB;

type
  TAlunoController = class
  private
    FAlunoDAO: TAlunoDAO;
  public
    constructor Create(AAlunoDAO: TAlunoDAO);
    function CriarAluno(Aluno: TAluno): Boolean;
    function LerAluno(Id: Integer): TAluno;
    function AtualizarAluno(Aluno: TAluno): Boolean;
    function DeletarAluno(Id: Integer): Boolean;
  end;

implementation

constructor TAlunoController.Create(AAlunoDAO: TAlunoDAO);
begin
  FAlunoDAO := AAlunoDAO;
end;

function TAlunoController.CriarAluno(Aluno: TAluno): Boolean;
begin

  if Aluno.Nome = '' then
    raise Exception.Create('O nome do aluno n�o pode ser vazio.');

  if Aluno.Curso = nil then
    raise Exception.Create('O aluno deve estar matriculado em um curso.');


  Result := FAlunoDAO.CriarAluno(Aluno);
end;

function TAlunoController.LerAluno(Id: Integer): TAluno;
begin
  Result := FAlunoDAO.LerAluno(Id);
end;

function TAlunoController.AtualizarAluno(Aluno: TAluno): Boolean;
begin

  if Aluno.Nome = '' then
    raise Exception.Create('O nome do aluno n�o pode ser vazio.');

  if Aluno.Curso = nil then
    raise Exception.Create('O aluno deve estar matriculado em um curso.');


  Result := FAlunoDAO.AtualizarAluno(Aluno);
end;

function TAlunoController.DeletarAluno(Id: Integer): Boolean;
begin
  Result := FAlunoDAO.DeletarAluno(Id);
end;

end.

