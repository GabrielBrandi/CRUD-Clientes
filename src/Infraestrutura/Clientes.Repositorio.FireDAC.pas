unit Clientes.Repositorio.FireDAC;

interface

uses FireDAC.Comp.Client, Clientes.Dominio, Clientes.Contratos;

type
  TRepositorioCliente = class(TInterfacedObject, IRepositorioCliente)
  private
    FConexao: TFDConnection;
    function NovaConsulta: TFDQuery;
    function LerClientes(AConsulta: TFDQuery): TArray<TClienteConsulta>;
  public
    constructor Create(AConexao: TFDConnection);
    function Salvar(const ACliente: TCliente): Integer;
    procedure Excluir(const AID: Integer);
    function Pesquisar(const AFiltro: TFiltroCliente): TArray<TClienteConsulta>;
    function ListarRelatorio(const AFiltro: TFiltroRelatorio): TArray<TClienteConsulta>;
  end;

implementation

uses System.SysUtils, System.Generics.Collections, Data.DB,
  FireDAC.Stan.Param, FireDAC.Stan.Option, Clientes.Consultas, Clientes.Excecoes;

constructor TRepositorioCliente.Create(AConexao: TFDConnection);
begin
  inherited Create;

  if AConexao = nil then
    LancarExcecao(EArgumentException.Create('Informe a conexão FireDAC.'));

  FConexao := AConexao;
end;

function TRepositorioCliente.NovaConsulta: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConexao;
end;

function TRepositorioCliente.Salvar(const ACliente: TCliente): Integer;
var
  LConsulta: TFDQuery;
begin
  ACliente.Validar;

  if FConexao.InTransaction then
    LancarExcecao(Exception.Create('Salvar requer uma conexão sem transação externa.'));

  FConexao.Connected := True;
  LConsulta := NovaConsulta;

  try
    if ACliente.ID = 0 then
      LConsulta.SQL.Text := 'INSERT INTO CLIENTE (NOME, CEP, CPF_CNPJ, ENDERECO, NUMERO, ' +
        'COMPLEMENTO, BAIRRO, CIDADE, DATANASCIMENTO) VALUES (:NOME, :CEP, ' +
        ':CPF_CNPJ, :ENDERECO, :NUMERO, :COMPLEMENTO, :BAIRRO, :CIDADE, :NASCIMENTO) RETURNING ID'
    else
    begin
      LConsulta.SQL.Text := 'UPDATE CLIENTE SET NOME=:NOME, CEP=:CEP, CPF_CNPJ=:CPF_CNPJ, ' +
        'ENDERECO=:ENDERECO, NUMERO=:NUMERO, COMPLEMENTO=:COMPLEMENTO, ' +
        'BAIRRO=:BAIRRO, CIDADE=:CIDADE, DATANASCIMENTO=:NASCIMENTO WHERE ID=:ID';

      LConsulta.ParamByName('ID').AsInteger := ACliente.ID;
    end;

    LConsulta.ParamByName('NOME').AsString := Trim(ACliente.Nome);
    LConsulta.ParamByName('CEP').AsString := ACliente.CEP;
    LConsulta.ParamByName('CPF_CNPJ').AsString := ACliente.CPFCNPJ;
    LConsulta.ParamByName('ENDERECO').AsString := ACliente.Endereco;
    LConsulta.ParamByName('NUMERO').AsString := ACliente.Numero;
    LConsulta.ParamByName('COMPLEMENTO').AsString := ACliente.Complemento;
    LConsulta.ParamByName('BAIRRO').AsString := ACliente.Bairro;
    LConsulta.ParamByName('CIDADE').AsInteger := ACliente.CidadeID;
    LConsulta.ParamByName('NASCIMENTO').DataType := ftDate;

    if ACliente.TemDataNascimento then
      LConsulta.ParamByName('NASCIMENTO').AsDate := Trunc(ACliente.DataNascimento)
    else
      LConsulta.ParamByName('NASCIMENTO').Clear;

    FConexao.StartTransaction;

    try
      if ACliente.ID = 0 then
      begin
        LConsulta.Open;

        Result := LConsulta.FieldByName('ID').AsInteger;
        LConsulta.Close;
      end
      else
      begin
        LConsulta.ExecSQL;
        if LConsulta.RowsAffected <> 1 then
          LancarExcecao(Exception.Create('Cliente não encontrado para alteração.'));

        Result := ACliente.ID;
      end;

      FConexao.Commit;
    except
      on LErro: Exception do
      begin
        if FConexao.InTransaction then
          FConexao.Rollback;

        ExibirErro(LErro);
        raise;
      end;
    end;
  finally
    LConsulta.Free;
  end;
end;

procedure TRepositorioCliente.Excluir(const AID: Integer);
var
  LConsulta: TFDQuery;
begin
  TCliente.ValidarExclusao(AID);

  if FConexao.InTransaction then
    LancarExcecao(Exception.Create('Excluir requer uma conexão sem transação externa.'));

  FConexao.Connected := True;
  LConsulta := NovaConsulta;

  try
    LConsulta.SQL.Text := 'DELETE FROM CLIENTE WHERE ID=:ID';
    LConsulta.ParamByName('ID').AsInteger := AID;

    FConexao.StartTransaction;

    try
      LConsulta.ExecSQL;
      if LConsulta.RowsAffected <> 1 then
        LancarExcecao(Exception.Create('Cliente não encontrado para exclusão.'));

      FConexao.Commit;
    except
      on LErro: Exception do
      begin
        if FConexao.InTransaction then
          FConexao.Rollback;

        ExibirErro(LErro);
        raise;
      end;
    end;
  finally
    LConsulta.Free;
  end;
end;

function TRepositorioCliente.LerClientes(AConsulta: TFDQuery): TArray<TClienteConsulta>;
var
  LLista: TList<TClienteConsulta>;
  LItem: TClienteConsulta;
begin
  LLista := TList<TClienteConsulta>.Create;

  try
    AConsulta.Open;

    while not AConsulta.Eof do
    begin
      LItem := Default(TClienteConsulta);
      LItem.Cliente.ID := AConsulta.FieldByName('ID').AsInteger;
      LItem.Cliente.Nome := AConsulta.FieldByName('NOME').AsString;
      LItem.Cliente.CEP := Trim(AConsulta.FieldByName('CEP').AsString);
      LItem.Cliente.CPFCNPJ := AConsulta.FieldByName('CPF_CNPJ').AsString;
      LItem.Cliente.Endereco := AConsulta.FieldByName('ENDERECO').AsString;
      LItem.Cliente.Numero := AConsulta.FieldByName('NUMERO').AsString;
      LItem.Cliente.Complemento := AConsulta.FieldByName('COMPLEMENTO').AsString;
      LItem.Cliente.Bairro := AConsulta.FieldByName('BAIRRO').AsString;
      LItem.Cliente.CidadeID := AConsulta.FieldByName('CIDADE').AsInteger;
      LItem.Cliente.TemDataNascimento := not AConsulta.FieldByName('DATANASCIMENTO').IsNull;

      if LItem.Cliente.TemDataNascimento then
        LItem.Cliente.DataNascimento := AConsulta.FieldByName('DATANASCIMENTO').AsDateTime;

      LItem.Cidade := AConsulta.FieldByName('CIDADE_NOME').AsString;
      LItem.Estado := AConsulta.FieldByName('ESTADO_NOME').AsString;
      LItem.UF := AConsulta.FieldByName('UF').AsString;
      LLista.Add(LItem);
      AConsulta.Next;
    end;

    Result := LLista.ToArray;
  finally
    LLista.Free;
  end;
end;

function TRepositorioCliente.Pesquisar(const AFiltro: TFiltroCliente): TArray<TClienteConsulta>;
var
  LConsulta: TFDQuery;
begin
  LConsulta := NovaConsulta;

  try
    TConsultasCliente.PrepararPesquisa(LConsulta, AFiltro);

    Result := LerClientes(LConsulta);
  finally
    LConsulta.Free;
  end;
end;

function TRepositorioCliente.ListarRelatorio(const AFiltro: TFiltroRelatorio): TArray<TClienteConsulta>;
var
  LConsulta: TFDQuery;
begin
  AFiltro.Validar;
  LConsulta := NovaConsulta;

  try
    TConsultasCliente.PrepararRelatorio(LConsulta, AFiltro);

    Result := LerClientes(LConsulta);
  finally
    LConsulta.Free;
  end;
end;

end.
