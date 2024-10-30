unit frmMateria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, MateriaModel, MateriaController, MateriaDAO;

type
  TFormMateria = class(TForm)
    NameMateria: TEdit;
    CadastrarMateriaLabel: TLabel;
    btnCadastrar: TButton;
    gridMaterias: TStringGrid;

    procedure btnCadastrarClick(Sender: TObject);
  private
    procedure AtualizarGrid;
  public
  end;

var
  FormMateria: TFormMateria;

implementation

{$R *.dfm}

procedure TFormMateria.btnCadastrarClick(Sender: TObject);
var
  Materia: TMateria;
  Controller: TMateriaController;
  MateriaDAO: TMateriaDAO;
begin
  Materia := TMateria.Create;
  try
    Materia.Nome := NameMateria.Text;

    MateriaDAO := TMateriaDAO.Create;
    Controller := TMateriaController.Create(MateriaDAO);
    try
      if Controller.CriarMateria(Materia) then
      begin
        ShowMessage('Matéria adicionada com sucesso.');
        NameMateria.Clear;
        AtualizarGrid;
      end;
    except
      on E: Exception do
        ShowMessage('Erro ao adicionar matéria: ' + E.Message);
    end;
  finally
    Materia.Free;
    Controller.Free;
    MateriaDAO.Free;
  end;
end;

procedure TFormMateria.AtualizarGrid;
var
  MateriaDAO: TMateriaDAO;
  Materia: TMateria;
  i: Integer;
begin
  MateriaDAO := TMateriaDAO.Create;
  try

    gridMaterias.RowCount := 1;
    gridMaterias.Cells[0, 0] := 'ID';
    gridMaterias.Cells[1, 0] := 'Nome';

    i := 1;

    Materia := MateriaDAO.LerMateria(i);
    while Materia <> nil do
    begin
      gridMaterias.RowCount := gridMaterias.RowCount + 1;
      gridMaterias.Cells[0, i] := Materia.Id.ToString;
      gridMaterias.Cells[1, i] := Materia.Nome;
      Inc(i);
      Materia := MateriaDAO.LerMateria(i);
    end;
  finally
    MateriaDAO.Free;
  end;
end;

end.

