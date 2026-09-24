unit Clientes.ViaCEP;

interface

uses Clientes.Dominio, Clientes.Contratos;

type
  TServicoViaCEP = class(TInterfacedObject, IServicoCEP)
  public
    function Consultar(const ACEP: string): TEnderecoCEP;
  end;

implementation

uses System.SysUtils, System.JSON, System.Net.HttpClient, Clientes.Excecoes;

function TServicoViaCEP.Consultar(const ACEP: string): TEnderecoCEP;
var
  LHTTP: THTTPClient;
  LResposta: IHTTPResponse;
  LJSON: TJSONValue;
begin
  if (Length(ACEP) <> 8) or not SomenteDigitos(ACEP) then
    LancarExcecao(Exception.Create('CEP deve conter 8 dígitos.'));

  LHTTP := THTTPClient.Create;
  LJSON := nil;

  try
    LHTTP.ConnectionTimeout := 5000;
    LHTTP.ResponseTimeout := 10000;

    try
      LResposta := LHTTP.Get('https://viacep.com.br/ws/' + ACEP + '/json/');
    except
      on LErro: Exception do
        LancarExcecao(Exception.Create('Não foi possível consultar o CEP. Verifique sua conexão.'));
    end;

    if LResposta.StatusCode <> 200 then
      LancarExcecao(Exception.CreateFmt('ViaCEP retornou HTTP %d.', [LResposta.StatusCode]));

    LJSON := TJSONObject.ParseJSONValue(LResposta.ContentAsString(TEncoding.UTF8));

    if not (LJSON is TJSONObject) then
      LancarExcecao(Exception.Create('Resposta inválida do ViaCEP.'));

    if SameText(LJSON.GetValue<string>('erro', 'false'), 'true') then
      LancarExcecao(Exception.Create('CEP não encontrado.'));

    Result := Default(TEnderecoCEP);
    Result.CEP := ACEP;
    Result.Endereco := LJSON.GetValue<string>('logradouro', '');
    Result.Bairro := LJSON.GetValue<string>('bairro', '');
    Result.Cidade := LJSON.GetValue<string>('localidade', '');
    Result.UF := LJSON.GetValue<string>('uf', '');

    if (Result.Cidade = '') or (Length(Result.UF) <> 2) then
      LancarExcecao(Exception.Create('ViaCEP retornou uma localidade incompleta.'));
  finally
    LJSON.Free;
    LHTTP.Free;
  end;
end;

end.
