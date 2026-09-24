unit Principal;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Menus,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Stan.Async, FireDAC.DApt,
  Clientes.Dominio, Clientes.Controlador;

type
  TFrmPrincipal = class(TForm)
    PnlMenu: TPanel;
    PnlCadastro: TPanel;
    PnlRelatorio: TPanel;
    PnlSair: TPanel;
    PnlPrincipal: TPanel;
    PgcClientes: TPageControl;
    AbaConsulta: TTabSheet;
    AbaCadastro: TTabSheet;
    PnlCabecalhoCadastro: TPanel;
    LblTituloCadastro: TLabel;
    LblDescricaoCadastro: TLabel;
    PnlFiltros: TPanel;
    LblFiltroID: TLabel;
    LblFiltroNome: TLabel;
    LblFiltroDocumento: TLabel;
    LblFiltroCEP: TLabel;
    LblFiltroEstado: TLabel;
    LblFiltroCidade: TLabel;
    LblFiltroNascimento: TLabel;
    EdtFiltroID: TEdit;
    EdtFiltroNome: TEdit;
    EdtFiltroDocumento: TEdit;
    EdtFiltroCEP: TEdit;
    CbxFiltroEstado: TDBLookupComboBox;
    CbxFiltroCidade: TDBLookupComboBox;
    DtpFiltroNascimento: TDateTimePicker;
    PnlFiltrar: TPanel;
    PnlLimparFiltros: TPanel;
    GrdClientes: TDBGrid;
    PnlRodapeCadastro: TPanel;
    LblTotalClientes: TLabel;
    PnlTituloFormulario: TPanel;
    LblTituloFormulario: TLabel;
    LblDescricaoFormulario: TLabel;
    ScrCadastro: TScrollBox;
    LblID: TLabel;
    LblNome: TLabel;
    LblDocumento: TLabel;
    LblNascimento: TLabel;
    LblCEP: TLabel;
    LblEndereco: TLabel;
    LblNumero: TLabel;
    LblComplemento: TLabel;
    LblBairro: TLabel;
    LblEstado: TLabel;
    LblCidade: TLabel;
    EdtID: TEdit;
    EdtNome: TEdit;
    EdtDocumento: TEdit;
    DtpNascimento: TDateTimePicker;
    EdtCEP: TEdit;
    EdtEndereco: TEdit;
    EdtNumero: TEdit;
    EdtComplemento: TEdit;
    EdtBairro: TEdit;
    CbxEstado: TDBLookupComboBox;
    CbxCidade: TDBLookupComboBox;
    PnlAcoesCadastro: TPanel;
    PnlSalvar: TPanel;
    PnlCancelar: TPanel;
    LblCadastroSituacao: TLabel;
    QryClientes: TFDQuery;
    QryEstados: TFDQuery;
    QryCidades: TFDQuery;
    QryCidadesFiltro: TFDQuery;
    DtsClientes: TDataSource;
    DtsEstados: TDataSource;
    DtsCidades: TDataSource;
    DtsCidadesFiltro: TDataSource;
    MnuClientes: TPopupMenu;
    MniEditar: TMenuItem;
    MniExcluir: TMenuItem;
    AbaRelatorio: TTabSheet;
    PnlFiltrosRelatorio: TPanel;
    LblTituloRelatorio: TLabel;
    LblDescricaoRelatorio: TLabel;
    LblIDInicial: TLabel;
    LblIDFinal: TLabel;
    LblEstadoRelatorio: TLabel;
    LblCidadeRelatorio: TLabel;
    EdtIDInicial: TEdit;
    EdtIDFinal: TEdit;
    CbxEstadoRelatorio: TDBLookupComboBox;
    CbxCidadeRelatorio: TDBLookupComboBox;
    PnlFiltrarRelatorio: TPanel;
    PnlLimparFiltrosRelatorio: TPanel;
    PnlVisualizarRelatorio: TPanel;
    PnlVoltarRelatorio: TPanel;
    GrdRelatorio: TDBGrid;
    LblSituacaoRelatorio: TLabel;
    QryRelatorio: TFDQuery;
    QryCidadesRelatorio: TFDQuery;
    DtsRelatorio: TDataSource;
    DtsCidadesRelatorio: TDataSource;
    procedure FormularioCriar(AOrigem: TObject);
    procedure FormularioExibir(AOrigem: TObject);
    procedure FormularioAtivar(AOrigem: TObject);
    procedure FormularioDestruir(AOrigem: TObject);
    procedure FormularioTecla(AOrigem: TObject; var ATecla: Word; AModificadores: TShiftState);
    procedure PainelEntrar(AOrigem: TObject);
    procedure PainelSair(AOrigem: TObject);
    procedure CadastroClicar(AOrigem: TObject);
    procedure RelatorioClicar(AOrigem: TObject);
    procedure SairClicar(AOrigem: TObject);
    procedure FiltrarClicar(AOrigem: TObject);
    procedure LimparFiltrosClicar(AOrigem: TObject);
    procedure SalvarClicar(AOrigem: TObject);
    procedure CancelarClicar(AOrigem: TObject);
    procedure FiltrarRelatorioClicar(AOrigem: TObject);
    procedure LimparFiltrosRelatorioClicar(AOrigem: TObject);
    procedure VisualizarRelatorioClicar(AOrigem: TObject);
    procedure VoltarRelatorioClicar(AOrigem: TObject);
    procedure EstadoAlterado(AOrigem: TObject);
    procedure FiltroEstadoAlterado(AOrigem: TObject);
    procedure GridMenu(AOrigem: TObject; APosicao: TPoint; var ATratado: Boolean);
    procedure EditarCliente(AOrigem: TObject);
    procedure ExcluirCliente(AOrigem: TObject);
    procedure EstadoRelatorioAlterado(AOrigem: TObject);
  private
    FConexao: TFDConnection;
    FControlador: TControladorCliente;
    FCarregando: Boolean;
    FSalvando: Boolean;
    FClienteID: Integer;
    procedure PrepararConexao;
    procedure CarregarClientes;
    procedure LimparFiltros;
    procedure LimparCadastro;
    procedure AbrirCadastro;
    procedure SalvarCliente;
    procedure CarregarRelatorio;
    procedure LimparFiltrosRelatorio;
    function LerFiltrosRelatorio: TFiltroRelatorio;
    procedure SelecionarPagina(APagina: TTabSheet);
    procedure RestaurarCor(APainel: TPanel);
    function LerFiltros: TFiltroCliente;
    function LerCadastro: TCliente;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses FireDAC.VCLUI.Wait, Clientes.Conexao, Clientes.Repositorio.FireDAC,
  Clientes.ViaCEP, Clientes.Consultas, Clientes.Relatorio, Clientes.Excecoes;

{$R *.dfm}

type
  TGradeClientes = class(TDBGrid);

const
  CorMenu = $0031261C;
  CorMenuSelecionado = $00624C35;
  CorMenuSobre = $00816445;
  CorAcao = $00A47A19;
  CorAcaoSobre = $00BD9025;
  CorSairSobre = $00544FB0;

function RetirarMascara(const AValor: string): string;
var
  LCaractere: Char;
begin
  Result := '';

  for LCaractere in Trim(AValor) do
    if not CharInSet(LCaractere, ['.', '-', '/', ' ']) then
      Result := Result + LCaractere;
end;

function IdentificadorSelecionado(const AValor: Variant): Integer;
begin
  Result := 0;

  if not VarIsNull(AValor) and not VarIsEmpty(AValor) then
    Result := AValor;
end;

procedure TFrmPrincipal.FormularioCriar(AOrigem: TObject);
begin
  TGradeClientes(GrdClientes).OnContextPopup := GridMenu;
  DtpNascimento.Date := Date;
  DtpNascimento.Checked := False;
  DtpFiltroNascimento.Date := Date;
  DtpFiltroNascimento.Checked := False;
  SelecionarPagina(AbaConsulta);
end;

procedure TFrmPrincipal.FormularioExibir(AOrigem: TObject);
begin
  CarregarClientes;
end;

procedure TFrmPrincipal.FormularioAtivar(AOrigem: TObject);
begin
  if not Assigned(FControlador) or FCarregando or FSalvando then
    Exit;

  if PgcClientes.ActivePage = AbaConsulta then
    CarregarClientes
  else if PgcClientes.ActivePage = AbaRelatorio then
    CarregarRelatorio;
end;

procedure TFrmPrincipal.FormularioDestruir(AOrigem: TObject);
begin
  QryClientes.Close;
  QryEstados.Close;
  QryCidades.Close;
  QryCidadesFiltro.Close;
  QryRelatorio.Close;
  QryCidadesRelatorio.Close;
  FControlador.Free;
  FConexao.Free;
end;

procedure TFrmPrincipal.PrepararConexao;
var
  LConexao: TFDConnection;
  LControlador: TControladorCliente;
begin
  if not Assigned(FControlador) then
  begin
    LConexao := TFabricaConexao.Criar(TFabricaConexao.LocalizarConfiguracao);

    try
      LConexao.Connected := True;
      LControlador := TControladorCliente.Create(TRepositorioCliente.Create(LConexao), TServicoViaCEP.Create);
    except
      on LErro: Exception do
      begin
        LConexao.Free;
        ExibirErro(LErro);
        raise;
      end;
    end;

    FConexao := LConexao;
    FControlador := LControlador;
    QryClientes.Connection := FConexao;
    QryEstados.Connection := FConexao;
    QryCidades.Connection := FConexao;
    QryCidadesFiltro.Connection := FConexao;
    QryRelatorio.Connection := FConexao;
    QryCidadesRelatorio.Connection := FConexao;
  end;

  if not QryEstados.Active then
    TConsultasCliente.AbrirEstados(QryEstados);

  if not QryCidadesFiltro.Active then
    TConsultasCliente.AbrirCidades(QryCidadesFiltro, IdentificadorSelecionado(CbxFiltroEstado.KeyValue));
end;

function TFrmPrincipal.LerFiltros: TFiltroCliente;
begin
  Result := Default(TFiltroCliente);

  if Trim(EdtFiltroID.Text) <> '' then
    if not TryStrToInt(Trim(EdtFiltroID.Text), Result.ID) or (Result.ID <= 0) then
      LancarExcecao(Exception.Create('Informe um ID inteiro maior que zero.'));

  Result.Nome := Trim(EdtFiltroNome.Text);
  Result.CPFCNPJ := RetirarMascara(EdtFiltroDocumento.Text);
  Result.CEP := RetirarMascara(EdtFiltroCEP.Text);
  Result.EstadoID := IdentificadorSelecionado(CbxFiltroEstado.KeyValue);
  Result.CidadeID := IdentificadorSelecionado(CbxFiltroCidade.KeyValue);
  Result.FiltrarNascimento := DtpFiltroNascimento.Checked;
  Result.DataNascimento := Trunc(DtpFiltroNascimento.Date);

  if (Result.CEP <> '') and ((Length(Result.CEP) <> 8) or not SomenteDigitos(Result.CEP)) then
    LancarExcecao(Exception.Create('O filtro de CEP deve conter 8 dígitos.'));

  if (Result.CPFCNPJ <> '') and (not (Length(Result.CPFCNPJ) in [11, 14]) or not SomenteDigitos(Result.CPFCNPJ)) then
    LancarExcecao(Exception.Create('O filtro de CPF/CNPJ deve conter 11 ou 14 dígitos.'));
end;

procedure TFrmPrincipal.CarregarClientes;
var
  LFiltro: TFiltroCliente;
  LID: Integer;
begin
  if FCarregando then
    Exit;

  FCarregando := True;
  LID := 0;

  if QryClientes.Active and not QryClientes.IsEmpty then
    LID := QryClientes.FieldByName('ID').AsInteger;

  Screen.Cursor := crHourGlass;
  QryClientes.DisableControls;

  try
    try
      LFiltro := LerFiltros;
      PrepararConexao;
      TConsultasCliente.PrepararPesquisa(QryClientes, LFiltro);
      QryClientes.Open;
      if LID > 0 then
        QryClientes.Locate('ID', LID, []);

      TDateField(QryClientes.FieldByName('DATANASCIMENTO')).DisplayFormat := 'dd/mm/yyyy';
      LblTotalClientes.Caption := Format('%d cliente(s)', [QryClientes.RecordCount]);
      LblDescricaoCadastro.Font.Color := $007C6D5F;
      LblDescricaoCadastro.Hint := '';

      if QryClientes.IsEmpty then
        LblDescricaoCadastro.Caption := 'Nenhum cliente encontrado.'
      else
        LblDescricaoCadastro.Caption := 'Consulta atualizada.';
    except
      on LErro: Exception do
      begin
        QryClientes.Close;
        LblTotalClientes.Caption := 'Consulta indisponível';
        ExibirErro(LErro);
      end;
    end;
  finally
    QryClientes.EnableControls;
    Screen.Cursor := crDefault;
    FCarregando := False;
  end;
end;

procedure TFrmPrincipal.LimparFiltros;
begin
  EdtFiltroID.Clear;
  EdtFiltroNome.Clear;
  EdtFiltroDocumento.Clear;
  EdtFiltroCEP.Clear;
  CbxFiltroEstado.KeyValue := Null;
  CbxFiltroCidade.KeyValue := Null;
  DtpFiltroNascimento.Checked := False;
  QryCidadesFiltro.Close;
end;

procedure TFrmPrincipal.LimparCadastro;
begin
  FClienteID := 0;
  LblTituloFormulario.Caption := 'Cadastrar cliente';
  AbaCadastro.Caption := 'Cadastrar cliente';
  PnlSalvar.Caption := 'Salvar cliente';
  EdtID.Text := 'Gerado ao salvar';
  EdtNome.Clear;
  EdtDocumento.Clear;
  EdtCEP.Clear;
  EdtEndereco.Clear;
  EdtNumero.Clear;
  EdtComplemento.Clear;
  EdtBairro.Clear;
  CbxEstado.KeyValue := Null;
  CbxCidade.KeyValue := Null;
  DtpNascimento.Checked := False;
  QryCidades.Close;
  LblCadastroSituacao.Caption := '';
end;

procedure TFrmPrincipal.AbrirCadastro;
begin
  if PgcClientes.ActivePage = AbaCadastro then
    Exit;

  PrepararConexao;
  LimparCadastro;
  SelecionarPagina(AbaCadastro);

  if EdtNome.CanFocus then
    EdtNome.SetFocus;
end;

function TFrmPrincipal.LerCadastro: TCliente;
begin
  Result := Default(TCliente);
  Result.ID := FClienteID;
  Result.Nome := Trim(EdtNome.Text);
  Result.CPFCNPJ := RetirarMascara(EdtDocumento.Text);
  Result.CEP := RetirarMascara(EdtCEP.Text);
  Result.Endereco := Trim(EdtEndereco.Text);
  Result.Numero := Trim(EdtNumero.Text);
  Result.Complemento := Trim(EdtComplemento.Text);
  Result.Bairro := Trim(EdtBairro.Text);
  Result.CidadeID := IdentificadorSelecionado(CbxCidade.KeyValue);
  Result.TemDataNascimento := DtpNascimento.Checked;
  Result.DataNascimento := Trunc(DtpNascimento.Date);
end;

procedure TFrmPrincipal.SalvarCliente;
var
  LCliente: TCliente;
  LID: Integer;
begin
  if FSalvando then
    Exit;

  FSalvando := True;
  PnlSalvar.Enabled := False;

  try
    PrepararConexao;
    LCliente := LerCadastro;
    LID := FControlador.Salvar(LCliente);

    LimparCadastro;
    LimparFiltros;
    SelecionarPagina(AbaConsulta);
    CarregarClientes;

    if QryClientes.Active then
    begin
      QryClientes.Locate('ID', LID, []);
      LblDescricaoCadastro.Caption := Format('Cliente %d salvo com sucesso.', [LID]);
    end
    else
      LblDescricaoCadastro.Caption := Format('Cliente %d salvo. Não foi possível recarregar a consulta.', [LID]);
  finally
    PnlSalvar.Enabled := True;
    FSalvando := False;
  end;
end;

procedure TFrmPrincipal.GridMenu(AOrigem: TObject; APosicao: TPoint; var ATratado: Boolean);
var
  LCelula: TGridCoord;
  LPonto: TPoint;
begin
  ATratado := True;

  if not QryClientes.Active or QryClientes.IsEmpty then
    Exit;

  if APosicao.X >= 0 then
  begin
    LCelula := GrdClientes.MouseCoord(APosicao.X, APosicao.Y);

    if (LCelula.Y < 1) or (LCelula.Y >= TGradeClientes(GrdClientes).RowCount) then
      Exit;

    QryClientes.MoveBy(LCelula.Y - TGradeClientes(GrdClientes).Row);
    LPonto := GrdClientes.ClientToScreen(APosicao);
  end
  else
    LPonto := GrdClientes.ClientToScreen(Point(24, 24));

  MnuClientes.Popup(LPonto.X, LPonto.Y);
end;

procedure TFrmPrincipal.EditarCliente(AOrigem: TObject);
begin
  try
    if not QryClientes.Active or QryClientes.IsEmpty then
      Exit;

    PrepararConexao;
    LimparCadastro;
    FClienteID := QryClientes.FieldByName('ID').AsInteger;
    EdtID.Text := IntToStr(FClienteID);
    EdtNome.Text := QryClientes.FieldByName('NOME').AsString;
    EdtDocumento.Text := QryClientes.FieldByName('CPF_CNPJ').AsString;
    EdtCEP.Text := Trim(QryClientes.FieldByName('CEP').AsString);
    EdtEndereco.Text := QryClientes.FieldByName('ENDERECO').AsString;
    EdtNumero.Text := QryClientes.FieldByName('NUMERO').AsString;
    EdtComplemento.Text := QryClientes.FieldByName('COMPLEMENTO').AsString;
    EdtBairro.Text := QryClientes.FieldByName('BAIRRO').AsString;
    CbxEstado.KeyValue := QryClientes.FieldByName('ESTADO_ID').AsInteger;
    TConsultasCliente.AbrirCidades(QryCidades, IdentificadorSelecionado(CbxEstado.KeyValue));
    CbxCidade.KeyValue := QryClientes.FieldByName('CIDADE').AsInteger;
    DtpNascimento.Checked := not QryClientes.FieldByName('DATANASCIMENTO').IsNull;

    if DtpNascimento.Checked then
      DtpNascimento.Date := QryClientes.FieldByName('DATANASCIMENTO').AsDateTime;

    LblTituloFormulario.Caption := 'Editar cliente';
    AbaCadastro.Caption := 'Editar cliente';
    PnlSalvar.Caption := 'Salvar alterações';
    SelecionarPagina(AbaCadastro);

    if EdtNome.CanFocus then
      EdtNome.SetFocus;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.ExcluirCliente(AOrigem: TObject);
var
  LID: Integer;
begin
  try
    if not QryClientes.Active or QryClientes.IsEmpty then
      Exit;

    LID := QryClientes.FieldByName('ID').AsInteger;
    TCliente.ValidarExclusao(LID);

    if Application.MessageBox(PChar(Format('Excluir o cliente %d - %s?',
      [LID, QryClientes.FieldByName('NOME').AsString])), 'Excluir cliente',
      MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2) <> IDYES then
      Exit;

    FControlador.Excluir(LID);
    CarregarClientes;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

function TFrmPrincipal.LerFiltrosRelatorio: TFiltroRelatorio;
begin
  Result := Default(TFiltroRelatorio);

  if Trim(EdtIDInicial.Text) <> '' then
    if not TryStrToInt(Trim(EdtIDInicial.Text), Result.IDInicial) or (Result.IDInicial <= 0) then
      LancarExcecao(Exception.Create('Informe um ID inicial inteiro maior que zero.'));

  if Trim(EdtIDFinal.Text) <> '' then
    if not TryStrToInt(Trim(EdtIDFinal.Text), Result.IDFinal) or (Result.IDFinal <= 0) then
      LancarExcecao(Exception.Create('Informe um ID final inteiro maior que zero.'));

  Result.EstadoID := IdentificadorSelecionado(CbxEstadoRelatorio.KeyValue);
  Result.CidadeID := IdentificadorSelecionado(CbxCidadeRelatorio.KeyValue);
  Result.Validar;
end;

procedure TFrmPrincipal.CarregarRelatorio;
begin
  Screen.Cursor := crHourGlass;
  QryRelatorio.DisableControls;

  try
    try
      PrepararConexao;
      TConsultasCliente.PrepararRelatorio(QryRelatorio, LerFiltrosRelatorio);
      QryRelatorio.Open;
      LblSituacaoRelatorio.Caption := Format('%d cliente(s) no relatório.', [QryRelatorio.RecordCount]);

      if QryRelatorio.IsEmpty then
        LblSituacaoRelatorio.Caption := 'Nenhum cliente encontrado para os filtros informados.';
    except
      on LErro: Exception do
      begin
        QryRelatorio.Close;
        ExibirErro(LErro);
      end;
    end;
  finally
    QryRelatorio.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipal.LimparFiltrosRelatorio;
begin
  EdtIDInicial.Clear;
  EdtIDFinal.Clear;
  CbxEstadoRelatorio.KeyValue := Null;
  CbxCidadeRelatorio.KeyValue := Null;
  PrepararConexao;
  TConsultasCliente.AbrirCidades(QryCidadesRelatorio, 0);
end;

procedure TFrmPrincipal.EstadoRelatorioAlterado(AOrigem: TObject);
begin
  CbxCidadeRelatorio.KeyValue := Null;

  try
    PrepararConexao;
    TConsultasCliente.AbrirCidades(QryCidadesRelatorio, IdentificadorSelecionado(CbxEstadoRelatorio.KeyValue));
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.EstadoAlterado(AOrigem: TObject);
begin
  CbxCidade.KeyValue := Null;

  try
    PrepararConexao;
    TConsultasCliente.AbrirCidades(QryCidades, IdentificadorSelecionado(CbxEstado.KeyValue));
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.FiltroEstadoAlterado(AOrigem: TObject);
begin
  CbxFiltroCidade.KeyValue := Null;

  try
    PrepararConexao;
    TConsultasCliente.AbrirCidades(QryCidadesFiltro, IdentificadorSelecionado(CbxFiltroEstado.KeyValue));
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.SelecionarPagina(APagina: TTabSheet);
begin
  PgcClientes.ActivePage := APagina;
  RestaurarCor(PnlCadastro);
  RestaurarCor(PnlRelatorio);
end;

procedure TFrmPrincipal.RestaurarCor(APainel: TPanel);
begin
  if APainel.Parent = PnlMenu then
  begin
    if ((APainel = PnlCadastro) and (PgcClientes.ActivePage = AbaCadastro)) or
      ((APainel = PnlRelatorio) and (PgcClientes.ActivePage = AbaRelatorio)) then
      APainel.Color := CorMenuSelecionado
    else
      APainel.Color := CorMenu;
  end
  else
    APainel.Color := CorAcao;
end;

procedure TFrmPrincipal.PainelEntrar(AOrigem: TObject);
var
  LPainel: TPanel;
begin
  LPainel := TPanel(AOrigem);

  if LPainel = PnlSair then
    LPainel.Color := CorSairSobre
  else if LPainel.Parent = PnlMenu then
    LPainel.Color := CorMenuSobre
  else
    LPainel.Color := CorAcaoSobre;
end;

procedure TFrmPrincipal.PainelSair(AOrigem: TObject);
begin
  RestaurarCor(TPanel(AOrigem));
end;

procedure TFrmPrincipal.CadastroClicar(AOrigem: TObject);
begin
  try
    AbrirCadastro;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.RelatorioClicar(AOrigem: TObject);
begin
  try
    SelecionarPagina(AbaRelatorio);
    PrepararConexao;
    TConsultasCliente.AbrirCidades(QryCidadesRelatorio, IdentificadorSelecionado(CbxEstadoRelatorio.KeyValue));
    CarregarRelatorio;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.SairClicar(AOrigem: TObject);
begin
  try
    Close;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.FiltrarClicar(AOrigem: TObject);
begin
  try
    CarregarClientes;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.LimparFiltrosClicar(AOrigem: TObject);
begin
  try
    LimparFiltros;
    CarregarClientes;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.SalvarClicar(AOrigem: TObject);
begin
  try
    SalvarCliente;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.CancelarClicar(AOrigem: TObject);
begin
  try
    LimparCadastro;
    SelecionarPagina(AbaConsulta);
    CarregarClientes;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.FiltrarRelatorioClicar(AOrigem: TObject);
begin
  try
    CarregarRelatorio;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.LimparFiltrosRelatorioClicar(AOrigem: TObject);
begin
  try
    LimparFiltrosRelatorio;
    CarregarRelatorio;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.VisualizarRelatorioClicar(AOrigem: TObject);
begin
  try
    CarregarRelatorio;

    if QryRelatorio.Active then
    begin
      FControlador.Relatorio(LerFiltrosRelatorio, TRelatorioCliente.Create);
      LblSituacaoRelatorio.Caption := 'Relatório aberto no navegador. Use a opção de impressão para imprimir ou salvar em PDF.';
    end;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.VoltarRelatorioClicar(AOrigem: TObject);
begin
  try
    SelecionarPagina(AbaConsulta);
    CarregarClientes;
  except
    on LErro: Exception do
      ExibirErro(LErro);
  end;
end;

procedure TFrmPrincipal.FormularioTecla(AOrigem: TObject; var ATecla: Word; AModificadores: TShiftState);
begin
  if (ATecla in [VK_RETURN, VK_SPACE]) and (ActiveControl is TPanel) then
  begin
    if Assigned(TPanel(ActiveControl).OnClick) and ActiveControl.Enabled then
      TPanel(ActiveControl).OnClick(ActiveControl);
    ATecla := 0;
  end
  else if (ATecla = VK_RETURN) and (ActiveControl is TEdit) then
  begin
    if PgcClientes.ActivePage = AbaConsulta then
      CarregarClientes
    else if PgcClientes.ActivePage = AbaRelatorio then
      CarregarRelatorio
    else
      SelectNext(ActiveControl, True, True);

    ATecla := 0;
  end;
end;

end.
