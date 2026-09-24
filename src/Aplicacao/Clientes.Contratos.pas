unit Clientes.Contratos;

interface

uses Clientes.Dominio;

type
  IRepositorioCliente = interface
    ['{DDB6835D-7659-4E50-B9A7-EB773E519402}']
    function Salvar(const ACliente: TCliente): Integer;
    procedure Excluir(const AID: Integer);
    function Pesquisar(const AFiltro: TFiltroCliente): TArray<TClienteConsulta>;
    function ListarRelatorio(const AFiltro: TFiltroRelatorio): TArray<TClienteConsulta>;
  end;

  IRepositorioLocalidade = interface
    ['{B9828F57-FD31-4710-A0CE-9DFE0F72DA1C}']
    function Listar: TArray<TLocalidade>;
    function Localizar(const ACidade, AUF: string; out ALocalidade: TLocalidade): Boolean;
  end;

  IServicoCEP = interface
    ['{A42DA131-3314-44DA-A2CF-B2AA0F532928}']
    function Consultar(const ACEP: string): TEnderecoCEP;
  end;

  IRelatorioCliente = interface
    ['{B61B2358-1037-4104-A0FD-CA1E4C151C1B}']
    procedure Visualizar(const AClientes: TArray<TClienteConsulta>);
  end;

implementation

end.
