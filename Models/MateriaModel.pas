unit MateriaModel;

interface

type
  TMateria = class
  private
    FId: Integer;
    FNome: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;

    constructor Create(ANome: string); overload;
    constructor Create(AId: Integer; ANome: string); overload;
  end;

implementation

constructor TMateria.Create(ANome: string);
begin
  FNome := ANome;
end;

constructor TMateria.Create(AId: Integer; ANome: string);
begin
  FId := AId;
  FNome := ANome;
end;

end.

