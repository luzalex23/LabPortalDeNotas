object FormMateria: TFormMateria
  Left = 0
  Top = 0
  Caption = 'Cadastrar Materia'
  ClientHeight = 469
  ClientWidth = 794
  Color = clDarkorchid
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object CadastrarMateriaLabel: TLabel
    Left = 144
    Top = 24
    Width = 418
    Height = 40
    Caption = 'Cadastrar nova materia'
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Source Code Pro Black'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object NameMateria: TEdit
    Left = 152
    Top = 112
    Width = 266
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = 'Nome :'
  end
  object btnCadastrar: TButton
    Left = 424
    Top = 112
    Width = 177
    Height = 33
    Caption = 'Adicionar nova materia'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Microsoft PhagsPa'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    StyleName = 'Windows'
    OnClick = btnCadastrarClick
  end
  object gridMaterias: TStringGrid
    Left = 0
    Top = 208
    Width = 793
    Height = 233
    Color = clDarkorchid
    ColCount = 3
    RowCount = 9
    TabOrder = 2
  end
  object SQLite: TFDPhysSQLiteDriverLink
    DriverID = 'SQLite'
    Left = 264
    Top = 248
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      
        'Database=C:\Workspace\LabPortalDeNotas\Connector\labportalnotas.' +
        'db')
    LoginPrompt = False
    Left = 416
    Top = 272
  end
end
