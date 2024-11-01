unit MateriaController;

interface

uses
  MateriaDAO, MateriaModel, System.SysUtils, Data.DB;

type
  TMateriaController = class
  private
    FMateriaDAO: TMateriaDAO;
  public
    constructor Create(AMateriaDAO: TMateriaDAO);
    function CriarMateria(Materia: TMateria): Boolean;
    function LerMateria(Id: Integer): TMateria;
    function AtualizarMateria(Materia: TMateria): Boolean;
    function DeletarMateria(Id: Integer): Boolean;
  end;

implementation

constructor TMateriaController.Create(AMateriaDAO: TMateriaDAO);
begin
  FMateriaDAO := AMateriaDAO;
end;

function TMateriaController.CriarMateria(Materia: TMateria): Boolean;
begin
  if Materia.Nome = '' then
    raise Exception.Create('O nome da mat�ria n�o pode ser vazio.');

  Result := FMateriaDAO.CriarMateria(Materia);
end;

function TMateriaController.LerMateria(Id: Integer): TMateria;
begin
  Result := FMateriaDAO.LerMateria(Id);
end;

function TMateriaController.AtualizarMateria(Materia: TMateria): Boolean;
begin
  if Materia.Nome = '' then
    raise Exception.Create('O nome da mat�ria n�o pode ser vazio.');

  Result := FMateriaDAO.AtualizarMateria(Materia);
end;

function TMateriaController.DeletarMateria(Id: Integer): Boolean;
begin
  Result := FMateriaDAO.DeletarMateria(Id);
end;

end.

