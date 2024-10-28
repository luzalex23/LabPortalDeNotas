unit UsuarioController;

interface

uses
  UsuarioDAO, UsuarioModel, System.SysUtils, Data.DB;

type
  TUsuarioController = class
  private
    FUsuarioDAO: TUsuarioDAO;
  public
    constructor Create(AUsuarioDAO: TUsuarioDAO);
    function CriarUsuario(Usuario: TUsuario): Boolean;
    function LerUsuario(Id: Integer): TUsuario;
    function AtualizarUsuario(Usuario: TUsuario): Boolean;
    function DeletarUsuario(Id: Integer): Boolean;
  end;

implementation

constructor TUsuarioController.Create(AUsuarioDAO: TUsuarioDAO);
begin
  FUsuarioDAO := AUsuarioDAO;
end;

function TUsuarioController.CriarUsuario(Usuario: TUsuario): Boolean;
begin

  if Usuario.Nome = '' then
    raise Exception.Create('O nome do usuário não pode ser vazio.');

  if Usuario.Email = '' then
    raise Exception.Create('O email do usuário não pode ser vazio.');

  if Usuario.Senha = '' then
    raise Exception.Create('A senha do usuário não pode ser vazia.');

  Result := FUsuarioDAO.CriarUsuario(Usuario);
end;

function TUsuarioController.LerUsuario(Id: Integer): TUsuario;
begin
  Result := FUsuarioDAO.LerUsuario(Id);
end;

function TUsuarioController.AtualizarUsuario(Usuario: TUsuario): Boolean;
begin

  if Usuario.Nome = '' then
    raise Exception.Create('O nome do usuário não pode ser vazio.');

  if Usuario.Email = '' then
    raise Exception.Create('O email do usuário não pode ser vazio.');

  if Usuario.Senha = '' then
    raise Exception.Create('A senha do usuário não pode ser vazia.');

  Result := FUsuarioDAO.AtualizarUsuario(Usuario);
end;

function TUsuarioController.DeletarUsuario(Id: Integer): Boolean;
begin
  Result := FUsuarioDAO.DeletarUsuario(Id);
end;

end.

