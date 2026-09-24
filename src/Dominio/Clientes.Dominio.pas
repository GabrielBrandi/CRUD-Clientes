unit Clientes.Dominio;

interface

uses System.SysUtils;

type
  TCliente = record
    ID: Integer;
    Nome: string;
    CEP: string;
    CPFCNPJ: string;
    Endereco: string;
    Numero: string;
    Complemento: string;
    Bairro: string;
    CidadeID: Integer;
    DataNascimento: TDateTime;
    TemDataNascimento: Boolean;
    procedure Validar;
    class procedure ValidarExclusao(const AID: Integer); static;
  end;

  TEnderecoCEP = record
    CEP: string;
    Endereco: string;
    Bairro: string;
    Cidade: string;
    UF: string;
  end;

  TLocalidade = record
    CidadeID: Integer;
    Cidade: string;
    EstadoID: Integer;
    Estado: string;
    UF: string;
  end;

  TClienteConsulta = record
    Cliente: TCliente;
    Cidade: string;
    Estado: string;
    UF: string;
  end;

  TFiltroCliente = record
    ID: Integer;
    Nome: string;
    CPFCNPJ: string;
    CEP: string;
    CidadeID: Integer;
    EstadoID: Integer;
    DataNascimento: TDateTime;
    FiltrarNascimento: Boolean;
  end;

  TFiltroRelatorio = record
    IDInicial: Integer;
    IDFinal: Integer;
    CidadeID: Integer;
    EstadoID: Integer;
    procedure Validar;
  end;

function SomenteDigitos(const AValor: string): Boolean;

implementation

uses Clientes.Excecoes;

function SomenteDigitos(const AValor: string): Boolean;
var
  LCaractere: Char;
begin
  Result := AValor <> '';

  for LCaractere in AValor do
    if not CharInSet(LCaractere, ['0'..'9']) then
      Exit(False);
end;

procedure VerificarTamanho(const ACampo, AValor: string; ALimite: Integer);
begin
  if Length(AValor) > ALimite then
    LancarExcecao(Exception.CreateFmt('%s deve ter no máximo %d caracteres.',
      [ACampo, ALimite]));
end;

procedure TCliente.Validar;
begin
  if ID < 0 then
    LancarExcecao(Exception.Create('ID inválido.'));

  if Trim(Nome) = '' then
    LancarExcecao(Exception.Create('Informe o nome.'));

  VerificarTamanho('Nome', Nome, 80);

  if (Length(CEP) <> 8) or not SomenteDigitos(CEP) then
    LancarExcecao(Exception.Create('CEP deve conter 8 dígitos.'));

  if not (Length(CPFCNPJ) in [11, 14]) or not SomenteDigitos(CPFCNPJ) then
    LancarExcecao(Exception.Create('CPF/CNPJ deve conter 11 ou 14 dígitos.'));

  VerificarTamanho('Endereço', Endereco, 100);
  VerificarTamanho('Número', Numero, 20);
  VerificarTamanho('Complemento', Complemento, 60);
  VerificarTamanho('Bairro', Bairro, 100);

  if CidadeID <= 0 then
    LancarExcecao(Exception.Create('Selecione uma cidade cadastrada.'));

  if TemDataNascimento and (Trunc(DataNascimento) > Date) then
    LancarExcecao(Exception.Create('Data de nascimento não pode ser futura.'));
end;

class procedure TCliente.ValidarExclusao(const AID: Integer);
begin
  if AID <= 0 then
    LancarExcecao(Exception.Create('ID inválido.'));

  case AID of
    1, 5, 8, 10, 15:
      LancarExcecao(Exception.CreateFmt('O cliente %d não pode ser excluído.', [AID]));
  end;
end;

procedure TFiltroRelatorio.Validar;
begin
  if (IDInicial < 0) or (IDFinal < 0) or (CidadeID < 0) or (EstadoID < 0) then
    LancarExcecao(Exception.Create('Os filtros não podem conter IDs negativos.'));

  if (IDInicial > 0) and (IDFinal > 0) and (IDInicial > IDFinal) then
    LancarExcecao(Exception.Create('ID inicial deve ser menor ou igual ao final.'));
end;

end.
