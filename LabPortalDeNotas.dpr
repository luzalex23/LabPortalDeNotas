program LabPortalDeNotas;

uses
  Vcl.Forms,
  UsuarioModel in 'Models\UsuarioModel.pas',
  ProfessorModel in 'Models\ProfessorModel.pas',
  MateriaModel in 'Models\MateriaModel.pas',
  CursoModel in 'Models\CursoModel.pas',
  AlunoModel in 'Models\AlunoModel.pas',
  NotasModel in 'Models\NotasModel.pas',
  AlunoDAO in 'DAOs\AlunoDAO.pas',
  ProfessorDAO in 'DAOs\ProfessorDAO.pas',
  MateriaDAO in 'DAOs\MateriaDAO.pas',
  NotasDAO in 'DAOs\NotasDAO.pas',
  CursoDAO in 'DAOs\CursoDAO.pas',
  UsuarioDAO in 'DAOs\UsuarioDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
