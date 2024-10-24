unit AlunoModel;

interface

uses UsuarioModel, CursoModel;

type
  TAluno = class(TUsuario)
  private
    FCurso: TCurso;
  public
    property Curso: TCurso read FCurso write FCurso;

    constructor Create(ANome, AEmail, ASenha: string; ACurso: TCurso); overload;
  end;

implementation

constructor TAluno.Create(ANome, AEmail, ASenha: string; ACurso: TCurso);
begin
  inherited Create(ANome, AEmail, ASenha);  // Herança de TUsuario
  FCurso := ACurso;
end;

end.

