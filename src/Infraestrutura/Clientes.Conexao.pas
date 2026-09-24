unit Clientes.Conexao;

interface

uses FireDAC.Comp.Client;

type
  TFabricaConexao = class
  public
    class function LocalizarConfiguracao: string; static;
    class function Criar(const AArquivoINI: string): TFDConnection; static;
  end;

implementation

uses System.SysUtils, System.IniFiles, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.DApt, Clientes.Excecoes;

class function TFabricaConexao.LocalizarConfiguracao: string;
var
  LPasta: string;
  LArquivo: string;
  LIndice: Integer;
begin
  LArquivo := GetEnvironmentVariable('CRUD_CONFIGURACAO');

  if LArquivo <> '' then
  begin
    if not FileExists(LArquivo) then
      LancarExcecao(Exception.Create('Configuração não encontrada: ' + LArquivo));

    Exit(LArquivo);
  end;

  LPasta := ExtractFilePath(ParamStr(0));

  for LIndice := 0 to 4 do
  begin
    LArquivo := IncludeTrailingPathDelimiter(LPasta) + 'configuracao\aplicacao.ini';

    if FileExists(LArquivo) then
      Exit(LArquivo);

    LPasta := ExtractFileDir(ExcludeTrailingPathDelimiter(LPasta));
  end;

  LancarExcecao(Exception.Create('Configuração não encontrada. Execute scripts\iniciar-banco.ps1.'));
end;

class function TFabricaConexao.Criar(const AArquivoINI: string): TFDConnection;
var
  LConfiguracao: TMemIniFile;
begin
  if not FileExists(AArquivoINI) then
    LancarExcecao(Exception.Create('Configuração não encontrada: ' + AArquivoINI));

  LConfiguracao := TMemIniFile.Create(AArquivoINI, TEncoding.UTF8);

  try
    Result := TFDConnection.Create(nil);

    try
      Result.LoginPrompt := False;
      Result.Params.DriverID := 'FB';
      Result.Params.Values['Protocol'] := 'TCPIP';
      Result.Params.Values['Server'] := LConfiguracao.ReadString('Banco', 'Servidor', '127.0.0.1');
      Result.Params.Values['Port'] := LConfiguracao.ReadString('Banco', 'Porta', '3050');
      Result.Params.Database := LConfiguracao.ReadString('Banco', 'Arquivo', '');
      Result.Params.UserName := LConfiguracao.ReadString('Banco', 'Usuario', '');
      Result.Params.Password := GetEnvironmentVariable('CRUD_SENHA_BANCO');
      Result.Params.Values['CharacterSet'] := 'UTF8';

      if Result.Params.Password = '' then
        Result.Params.Password := LConfiguracao.ReadString('Banco', 'Senha', '');

      if (Result.Params.Database = '') or (Result.Params.UserName = '') or
        (Result.Params.Password = '') then
        LancarExcecao(Exception.Create('Configure Arquivo, Usuario e Senha em aplicacao.ini.'));
    except
      on LErro: Exception do
      begin
        Result.Free;
        ExibirErro(LErro);
        raise;
      end;
    end;
  finally
    LConfiguracao.Free;
  end;
end;

end.
