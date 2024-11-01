unit ProfessorModel;

interface

uses UsuarioModel, MateriaModel;

type
  TProfessor = class(TUsuario)
  private
    FMateria: TMateria;
  public
    property Materia: TMateria read FMateria write FMateria;

    constructor Create(ANome, AEmail, ASenha: string; AMateria: TMateria); overload;
  end;

implementation

constructor TProfessor.Create(ANome, AEmail, ASenha: string; AMateria: TMateria);
begin
  inherited Create(ANome, AEmail, ASenha);
  FMateria := AMateria;
end;

end.

