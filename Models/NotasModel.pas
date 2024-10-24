unit NotasModel;

interface

uses AlunoModel, MateriaModel;

type
  TNota = class
  private
    FId: Integer;
    FAluno: TAluno;
    FMateria: TMateria;
    FValor: Double;
  public
    property Id: Integer read FId write FId;
    property Aluno: TAluno read FAluno write FAluno;
    property Materia: TMateria read FMateria write FMateria;
    property Valor: Double read FValor write FValor;

    constructor Create(AAluno: TAluno; AMateria: TMateria; AValor: Double); overload;
  end;

implementation

constructor TNota.Create(AAluno: TAluno; AMateria: TMateria; AValor: Double);
begin
  FAluno := AAluno;
  FMateria := AMateria;
  FValor := AValor;
end;

end.

