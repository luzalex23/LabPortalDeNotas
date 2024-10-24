unit CursoModel;

interface

type
  TCurso = class
  private
    FId: Integer;
    FNome: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;

    constructor Create(AId: Integer; ANome: string); overload;
  end;

implementation

constructor TCurso.Create(AId: Integer; ANome: string);
begin
  FId := AId;
  FNome := ANome;
end;

end.

