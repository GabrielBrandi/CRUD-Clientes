unit Clientes.Controlador;

interface

uses Clientes.Dominio, Clientes.Contratos;

type
  TControladorCliente = class
  private
    FRepositorio: IRepositorioCliente;
    FCEP: IServicoCEP;
  public
    constructor Create(const ARepositorio: IRepositorioCliente; const ACEP: IServicoCEP);
    function Salvar(const ACliente: TCliente): Integer;
    procedure Excluir(const AID: Integer);
    function Pesquisar(const AFiltro: TFiltroCliente): TArray<TClienteConsulta>;
    function ConsultarCEP(const ACEP: string): TEnderecoCEP;
    procedure Relatorio(const AFiltro: TFiltroRelatorio; const ARelatorio: IRelatorioCliente);
  end;

implementation

uses System.SysUtils, Clientes.Excecoes;

constructor TControladorCliente.Create(const ARepositorio: IRepositorioCliente;
  const ACEP: IServicoCEP);
begin
  inherited Create;

  if (ARepositorio = nil) or (ACEP = nil) then
    LancarExcecao(EArgumentException.Create('Repositório e serviço de CEP são obrigatórios.'));

  FRepositorio := ARepositorio;
  FCEP := ACEP;
end;

function TControladorCliente.Salvar(const ACliente: TCliente): Integer;
begin
  ACliente.Validar;

  Result := FRepositorio.Salvar(ACliente);
end;

procedure TControladorCliente.Excluir(const AID: Integer);
begin
  TCliente.ValidarExclusao(AID);
  FRepositorio.Excluir(AID);
end;

function TControladorCliente.Pesquisar(const AFiltro: TFiltroCliente): TArray<TClienteConsulta>;
begin
  Result := FRepositorio.Pesquisar(AFiltro);
end;

function TControladorCliente.ConsultarCEP(const ACEP: string): TEnderecoCEP;
begin
  if (Length(ACEP) <> 8) or not SomenteDigitos(ACEP) then
    LancarExcecao(Exception.Create('CEP deve conter 8 dígitos.'));

  Result := FCEP.Consultar(ACEP);
end;

procedure TControladorCliente.Relatorio(const AFiltro: TFiltroRelatorio;
  const ARelatorio: IRelatorioCliente);
begin
  if ARelatorio = nil then
    LancarExcecao(EArgumentException.Create('Informe o adaptador de relatório.'));

  AFiltro.Validar;
  ARelatorio.Visualizar(FRepositorio.ListarRelatorio(AFiltro));
end;

end.
