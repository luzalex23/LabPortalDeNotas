unit UsuarioModel;

interface

type
  TUsuario = class
  private
    FId: Integer;
    FNome: string;
    FEmail: string;
    FSenha: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Email: string read FEmail write FEmail;
    property Senha: string read FSenha write FSenha;

    constructor Create(ANome, AEmail, ASenha: string); overload;
    constructor Create(AId: Integer; ANome, AEmail, ASenha: string); overload;
  end;

implementation

constructor TUsuario.Create(ANome, AEmail, ASenha: string);
begin
  FNome := ANome;
  FEmail := AEmail;
  FSenha := ASenha;
end;

constructor TUsuario.Create(AId: Integer; ANome, AEmail, ASenha: string);
begin
  FId := AId;
  FNome := ANome;
  FEmail := AEmail;
  FSenha := ASenha;
end;

end.

