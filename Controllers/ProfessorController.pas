unit ProfessorController;

interface

uses
  ProfessorDAO, ProfessorModel, System.SysUtils, Data.DB;

type
  TProfessorController = class
  private
    FProfessorDAO: TProfessorDAO;
  public
    constructor Create(AProfessorDAO: TProfessorDAO);
    function CriarProfessor(Professor: TProfessor): Boolean;
    function LerProfessor(Id: Integer): TProfessor;
    function AtualizarProfessor(Professor: TProfessor): Boolean;
    function DeletarProfessor(Id: Integer): Boolean;
  end;

implementation

constructor TProfessorController.Create(AProfessorDAO: TProfessorDAO);
begin
  FProfessorDAO := AProfessorDAO;
end;

function TProfessorController.CriarProfessor(Professor: TProfessor): Boolean;
begin
  if Professor.Nome = '' then
    raise Exception.Create('O nome do professor n�o pode ser vazio.');

  if Professor.Materia = nil then
    raise Exception.Create('O professor deve estar alocado em uma mat�ria.');

  Result := FProfessorDAO.CriarProfessor(Professor);
end;

function TProfessorController.LerProfessor(Id: Integer): TProfessor;
begin
  Result := FProfessorDAO.LerProfessor(Id);
end;

function TProfessorController.AtualizarProfessor(Professor: TProfessor): Boolean;
begin
  if Professor.Nome = '' then
    raise Exception.Create('O nome do professor n�o pode ser vazio.');

  if Professor.Materia = nil then
    raise Exception.Create('O professor deve estar alocado em uma mat�ria.');

  Result := FProfessorDAO.AtualizarProfessor(Professor);
end;

function TProfessorController.DeletarProfessor(Id: Integer): Boolean;
begin
  Result := FProfessorDAO.DeletarProfessor(Id);
end;

end.

