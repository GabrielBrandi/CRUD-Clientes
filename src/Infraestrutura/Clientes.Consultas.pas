unit Clientes.Consultas;

interface

uses FireDAC.Comp.Client, Clientes.Dominio;

type
  TConsultasCliente = class
  public
    class procedure PrepararPesquisa(AConsulta: TFDQuery; const AFiltro: TFiltroCliente); static;
    class procedure PrepararRelatorio(AConsulta: TFDQuery; const AFiltro: TFiltroRelatorio); static;
    class procedure AbrirEstados(AConsulta: TFDQuery); static;
    class procedure AbrirCidades(AConsulta: TFDQuery; const AEstadoID: Integer); static;
  end;

implementation

uses FireDAC.Stan.Param, FireDAC.Stan.Option;

class procedure TConsultasCliente.PrepararPesquisa(AConsulta: TFDQuery; const AFiltro: TFiltroCliente);
begin
  AConsulta.Close;
  AConsulta.FetchOptions.Mode := fmAll;
  AConsulta.UpdateOptions.ReadOnly := True;
  AConsulta.SQL.Text := 'SELECT C.*, M.NOME AS CIDADE_NOME, E.NOME AS ESTADO_NOME, E.UF, E.ID AS ESTADO_ID ' +
    'FROM CLIENTE C JOIN CIDADE M ON M.ID = C.CIDADE ' +
    'JOIN ESTADO E ON E.ID = M.ESTADOID WHERE 1 = 1';

  if AFiltro.ID > 0 then
    AConsulta.SQL.Add('AND C.ID = :ID');

  if AFiltro.Nome <> '' then
    AConsulta.SQL.Add('AND C.NOME CONTAINING :NOME');

  if AFiltro.CPFCNPJ <> '' then
    AConsulta.SQL.Add('AND C.CPF_CNPJ = :DOCUMENTO');

  if AFiltro.CEP <> '' then
    AConsulta.SQL.Add('AND C.CEP = :CEP');

  if AFiltro.CidadeID > 0 then
    AConsulta.SQL.Add('AND C.CIDADE = :CIDADE');

  if AFiltro.EstadoID > 0 then
    AConsulta.SQL.Add('AND M.ESTADOID = :ESTADO');

  if AFiltro.FiltrarNascimento then
    AConsulta.SQL.Add('AND C.DATANASCIMENTO = :NASCIMENTO');

  AConsulta.SQL.Add('ORDER BY C.ID');

  if AFiltro.ID > 0 then
    AConsulta.ParamByName('ID').AsInteger := AFiltro.ID;

  if AFiltro.Nome <> '' then
    AConsulta.ParamByName('NOME').AsString := AFiltro.Nome;

  if AFiltro.CPFCNPJ <> '' then
    AConsulta.ParamByName('DOCUMENTO').AsString := AFiltro.CPFCNPJ;

  if AFiltro.CEP <> '' then
    AConsulta.ParamByName('CEP').AsString := AFiltro.CEP;

  if AFiltro.CidadeID > 0 then
    AConsulta.ParamByName('CIDADE').AsInteger := AFiltro.CidadeID;

  if AFiltro.EstadoID > 0 then
    AConsulta.ParamByName('ESTADO').AsInteger := AFiltro.EstadoID;

  if AFiltro.FiltrarNascimento then
    AConsulta.ParamByName('NASCIMENTO').AsDate := Trunc(AFiltro.DataNascimento);
end;

class procedure TConsultasCliente.PrepararRelatorio(AConsulta: TFDQuery; const AFiltro: TFiltroRelatorio);
begin
  AFiltro.Validar;
  AConsulta.Close;
  AConsulta.FetchOptions.Mode := fmAll;
  AConsulta.UpdateOptions.ReadOnly := True;
  AConsulta.SQL.Text := 'SELECT C.*, M.NOME AS CIDADE_NOME, E.NOME AS ESTADO_NOME, E.UF ' +
    'FROM CLIENTE C JOIN CIDADE M ON M.ID = C.CIDADE ' +
    'JOIN ESTADO E ON E.ID = M.ESTADOID WHERE 1 = 1';

  if AFiltro.IDInicial > 0 then
    AConsulta.SQL.Add('AND C.ID >= :INICIAL');

  if AFiltro.IDFinal > 0 then
    AConsulta.SQL.Add('AND C.ID <= :FINAL');

  if AFiltro.CidadeID > 0 then
    AConsulta.SQL.Add('AND C.CIDADE = :CIDADE');

  if AFiltro.EstadoID > 0 then
    AConsulta.SQL.Add('AND M.ESTADOID = :ESTADO');

  AConsulta.SQL.Add('ORDER BY C.ID');

  if AFiltro.IDInicial > 0 then
    AConsulta.ParamByName('INICIAL').AsInteger := AFiltro.IDInicial;

  if AFiltro.IDFinal > 0 then
    AConsulta.ParamByName('FINAL').AsInteger := AFiltro.IDFinal;

  if AFiltro.CidadeID > 0 then
    AConsulta.ParamByName('CIDADE').AsInteger := AFiltro.CidadeID;

  if AFiltro.EstadoID > 0 then
    AConsulta.ParamByName('ESTADO').AsInteger := AFiltro.EstadoID;
end;

class procedure TConsultasCliente.AbrirEstados(AConsulta: TFDQuery);
begin
  AConsulta.Close;
  AConsulta.FetchOptions.Mode := fmAll;
  AConsulta.UpdateOptions.ReadOnly := True;
  AConsulta.SQL.Text := 'SELECT ID, NOME, UF FROM ESTADO ORDER BY NOME';
  AConsulta.Open;
end;

class procedure TConsultasCliente.AbrirCidades(AConsulta: TFDQuery; const AEstadoID: Integer);
begin
  AConsulta.Close;
  AConsulta.FetchOptions.Mode := fmAll;
  AConsulta.UpdateOptions.ReadOnly := True;
  AConsulta.SQL.Text := 'SELECT ID, NOME, ESTADOID FROM CIDADE';

  if AEstadoID > 0 then
    AConsulta.SQL.Add('WHERE ESTADOID = :ESTADO');

  AConsulta.SQL.Add('ORDER BY NOME');

  if AEstadoID > 0 then
    AConsulta.ParamByName('ESTADO').AsInteger := AEstadoID;

  AConsulta.Open;
end;

end.
