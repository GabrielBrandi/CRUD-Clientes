unit Clientes.Relatorio;

interface

uses Clientes.Dominio, Clientes.Contratos;

type
  TRelatorioCliente = class(TInterfacedObject, IRelatorioCliente)
  public
    class function MontarHTML(const AClientes: TArray<TClienteConsulta>): string; static;
    class function CriarArquivo(const AClientes: TArray<TClienteConsulta>): string; static;
    class procedure AbrirArquivo(const AArquivo: string); static;
    procedure Visualizar(const AClientes: TArray<TClienteConsulta>);
  end;

implementation

uses System.SysUtils, System.Classes, System.IOUtils, Winapi.Windows, Winapi.ShellAPI,
  Winapi.ActiveX, Vcl.Forms, Clientes.Excecoes;

function TextoHTML(const ATexto: string): string;
begin
  Result := StringReplace(ATexto, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&#39;', [rfReplaceAll]);
end;

class function TRelatorioCliente.MontarHTML(const AClientes: TArray<TClienteConsulta>): string;
var
  LHTML: TStringBuilder;
  LCliente: TClienteConsulta;
begin
  LHTML := TStringBuilder.Create;

  try
    LHTML.Append('<!doctype html><html lang="pt-BR"><head><meta charset="utf-8">');
    LHTML.Append('<title>Relatório de clientes</title><style>');
    LHTML.Append('@page{size:A4 landscape;margin:14mm}*{box-sizing:border-box}');
    LHTML.Append('body{font:13px Arial,sans-serif;color:#1c2631;margin:28px}');
    LHTML.Append('h1{font-size:24px;margin-bottom:8px}p{color:#536273}');
    LHTML.Append('table{width:100%;border-collapse:collapse;table-layout:fixed;margin-top:24px}');
    LHTML.Append('th,td{text-align:left;padding:10px 8px;border-bottom:1px solid #ccd3da;overflow-wrap:anywhere}');
    LHTML.Append('th{background:#edf1f5}th:first-child{width:6%}th:nth-child(2){width:24%}');
    LHTML.Append('th:nth-child(3){width:16%}th:nth-child(4){width:10%}');
    LHTML.Append('tr{break-inside:avoid}thead{display:table-header-group}');
    LHTML.Append('button{background:#197aa4;color:white;border:0;padding:12px 20px;cursor:pointer}');
    LHTML.Append('@media print{body{margin:0;font-size:10px}.acoes{display:none}th,td{padding:7px 5px}}');
    LHTML.Append('</style></head><body><div class="acoes">');
    LHTML.Append('<button onclick="window.print()">Imprimir / salvar em PDF</button></div>');
    LHTML.Append('<h1>Relatório de clientes</h1><p>Emitido em ');
    LHTML.Append(FormatDateTime('dd/mm/yyyy hh:nn', Now));
    LHTML.Append(Format(' · %d cliente(s)</p>', [Length(AClientes)]));
    LHTML.Append('<table><thead><tr><th>ID</th><th>Nome</th><th>CPF / CNPJ</th>');
    LHTML.Append('<th>CEP</th><th>Bairro</th><th>Cidade</th><th>Estado</th></tr></thead><tbody>');

    for LCliente in AClientes do
    begin
      LHTML.Append('<tr><td>' + IntToStr(LCliente.Cliente.ID) + '</td><td>');
      LHTML.Append(TextoHTML(LCliente.Cliente.Nome) + '</td><td>');
      LHTML.Append(TextoHTML(LCliente.Cliente.CPFCNPJ) + '</td><td>');
      LHTML.Append(TextoHTML(LCliente.Cliente.CEP) + '</td><td>');
      LHTML.Append(TextoHTML(LCliente.Cliente.Bairro) + '</td><td>');
      LHTML.Append(TextoHTML(LCliente.Cidade) + '</td><td>');
      LHTML.Append(TextoHTML(LCliente.Estado) + '</td></tr>');
    end;

    if Length(AClientes) = 0 then
      LHTML.Append('<tr><td colspan="7">Nenhum cliente encontrado.</td></tr>');

    LHTML.Append('</tbody></table></body></html>');
    Result := LHTML.ToString;
  finally
    LHTML.Free;
  end;
end;

class function TRelatorioCliente.CriarArquivo(const AClientes: TArray<TClienteConsulta>): string;
var
  LIdentificador: TGUID;
begin
  CreateGUID(LIdentificador);
  Result := TPath.Combine(TPath.GetTempPath, 'Clientes-' + GUIDToString(LIdentificador) + '.html');
  TFile.WriteAllText(Result, MontarHTML(AClientes), TEncoding.UTF8);
end;

class procedure TRelatorioCliente.AbrirArquivo(const AArquivo: string);
var
  LExecucao: TShellExecuteInfo;
  LResultadoCOM: HRESULT;
  LCodigoErro: Cardinal;
begin
  LResultadoCOM := CoInitialize(nil);

  try
    LExecucao := Default(TShellExecuteInfo);
    LExecucao.cbSize := SizeOf(LExecucao);
    LExecucao.fMask := SEE_MASK_NOASYNC or SEE_MASK_FLAG_NO_UI;
    LExecucao.Wnd := Application.Handle;
    LExecucao.lpVerb := 'open';
    LExecucao.lpFile := PChar(AArquivo);
    LExecucao.nShow := SW_SHOWNORMAL;

    if not ShellExecuteEx(@LExecucao) then
    begin
      LCodigoErro := GetLastError;
      LancarExcecao(Exception.Create('Não foi possível abrir o relatório: ' +
        SysErrorMessage(LCodigoErro) + sLineBreak + 'Arquivo: ' + AArquivo));
    end;
  finally
    if Succeeded(LResultadoCOM) then
      CoUninitialize;
  end;
end;

procedure TRelatorioCliente.Visualizar(const AClientes: TArray<TClienteConsulta>);
begin
  try
    AbrirArquivo(CriarArquivo(AClientes));
  except
    on LErro: Exception do
    begin
      ExibirErro(LErro);
      raise;
    end;
  end;
end;

end.
