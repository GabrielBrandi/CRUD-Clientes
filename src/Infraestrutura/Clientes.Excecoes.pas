unit Clientes.Excecoes;

interface

uses System.SysUtils;

procedure ExibirErro(AErro: Exception);
procedure LancarExcecao(AErro: Exception);

implementation

uses Vcl.Dialogs;

const
  ExcecaoExibida = 1129070932;

procedure ExibirErro(AErro: Exception);
begin
  if AErro.HelpContext = ExcecaoExibida then
    Exit;

  AErro.HelpContext := ExcecaoExibida;
  ShowMessage(AErro.Message);
end;

procedure LancarExcecao(AErro: Exception);
begin
  try
    raise AErro;
  except
    on LErro: Exception do
    begin
      ExibirErro(LErro);
      raise;
    end;
  end;
end;

end.
