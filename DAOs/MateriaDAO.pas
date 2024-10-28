unit MateriaDAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, MateriaModel;

type
  TMateriaDAO = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    function CriarMateria(Materia: TMateria): Boolean;
    function LerMateria(Id: Integer): TMateria;
    function AtualizarMateria(Materia: TMateria): Boolean;
    function DeletarMateria(Id: Integer): Boolean;
  end;

implementation

constructor TMateriaDAO.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;

function TMateriaDAO.CriarMateria(Materia: TMateria): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC CriarMateria :Nome';
    Query.ParamByName('Nome').AsString := Materia.Nome;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TMateriaDAO.LerMateria(Id: Integer): TMateria;
var
  Query: TFDQuery;
  Materia: TMateria;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC LerMateria :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.Open;
    if not Query.IsEmpty then
    begin
      Materia := TMateria.Create(Query.FieldByName('ID').AsInteger, Query.FieldByName('Nome').AsString);
      Result := Materia;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

function TMateriaDAO.AtualizarMateria(Materia: TMateria): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC AtualizarMateria :Id, :Nome';
    Query.ParamByName('Id').AsInteger := Materia.Id;
    Query.ParamByName('Nome').AsString := Materia.Nome;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

function TMateriaDAO.DeletarMateria(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := 'EXEC DeletarMateria :Id';
    Query.ParamByName('Id').AsInteger := Id;
    Query.ExecSQL;
    Result := True;
  finally
    Query.Free;
  end;
end;

end.

