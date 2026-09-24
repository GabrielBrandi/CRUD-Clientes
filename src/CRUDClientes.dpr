program CRUDClientes;

uses
  Vcl.Forms,
  Clientes.Dominio in 'Dominio\Clientes.Dominio.pas',
  Clientes.Contratos in 'Aplicacao\Clientes.Contratos.pas',
  Clientes.Controlador in 'Controladores\Clientes.Controlador.pas',
  Clientes.Conexao in 'Infraestrutura\Clientes.Conexao.pas',
  Clientes.Excecoes in 'Infraestrutura\Clientes.Excecoes.pas',
  Clientes.Repositorio.FireDAC in 'Infraestrutura\Clientes.Repositorio.FireDAC.pas',
  Clientes.ViaCEP in 'Infraestrutura\Clientes.ViaCEP.pas',
  Clientes.Consultas in 'Infraestrutura\Clientes.Consultas.pas',
  Clientes.Relatorio in 'Infraestrutura\Clientes.Relatorio.pas',
  Principal in 'Telas\Principal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
