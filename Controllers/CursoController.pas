unit CursoController;

interface

uses
  CursoDAO, CursoModel, System.SysUtils, Data.DB;

type
  TCursoController = class
  private
    FCursoDAO: TCursoDAO;
  public
    constructor Create(ACursoDAO: TCursoDAO);
    function CriarCurso(Curso: TCurso): Boolean;
    function LerCurso(Id: Integer): TCurso;
    function AtualizarCurso(Curso: TCurso): Boolean;
    function DeletarCurso(Id: Integer): Boolean;
  end;

implementation

constructor TCursoController.Create(ACursoDAO: TCursoDAO);
begin
  FCursoDAO := ACursoDAO;
end;

function TCursoController.CriarCurso(Curso: TCurso): Boolean;
begin
  if Curso.Nome = '' then
    raise Exception.Create('O nome do curso n�o pode ser vazio.');

  Result := FCursoDAO.CriarCurso(Curso);
end;

function TCursoController.LerCurso(Id: Integer): TCurso;
begin
  Result := FCursoDAO.LerCurso(Id);
end;

function TCursoController.AtualizarCurso(Curso: TCurso): Boolean;
begin
  if Curso.Nome = '' then
    raise Exception.Create('O nome do curso n�o pode ser vazio.');

  Result := FCursoDAO.AtualizarCurso(Curso);
end;

function TCursoController.DeletarCurso(Id: Integer): Boolean;
begin
  Result := FCursoDAO.DeletarCurso(Id);
end;

end.

