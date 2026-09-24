object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Controle de clientes'
  ClientHeight = 797
  ClientWidth = 1088
  Color = 16381682
  Constraints.MinHeight = 520
  Constraints.MinWidth = 960
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 3221020
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormularioAtivar
  OnCreate = FormularioCriar
  OnDestroy = FormularioDestruir
  OnKeyDown = FormularioTecla
  OnShow = FormularioExibir
  TextHeight = 17
  object PnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 797
    Align = alLeft
    BevelOuter = bvNone
    Color = 3221020
    ParentBackground = False
    TabOrder = 0
    object PnlCadastro: TPanel
      Left = 0
      Top = 0
      Width = 129
      Height = 64
      Cursor = crHandPoint
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Cadastrar cliente'
      Color = 3221020
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = CadastroClicar
      OnEnter = PainelEntrar
      OnExit = PainelSair
      OnMouseEnter = PainelEntrar
      OnMouseLeave = PainelSair
    end
    object PnlRelatorio: TPanel
      Left = 0
      Top = 64
      Width = 129
      Height = 64
      Cursor = crHandPoint
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Relat'#243'rio'
      Color = 3221020
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = True
      OnClick = RelatorioClicar
      OnEnter = PainelEntrar
      OnExit = PainelSair
      OnMouseEnter = PainelEntrar
      OnMouseLeave = PainelSair
    end
    object PnlSair: TPanel
      Left = 0
      Top = 733
      Width = 129
      Height = 64
      Cursor = crHandPoint
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Sair'
      Color = 3221020
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = SairClicar
      OnEnter = PainelEntrar
      OnExit = PainelSair
      OnMouseEnter = PainelEntrar
      OnMouseLeave = PainelSair
    end
  end
  object PnlPrincipal: TPanel
    Left = 129
    Top = 0
    Width = 959
    Height = 797
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object PgcClientes: TPageControl
      Left = 0
      Top = 0
      Width = 959
      Height = 797
      ActivePage = AbaRelatorio
      Align = alClient
      TabOrder = 0
      object AbaConsulta: TTabSheet
        Caption = 'Consultar clientes'
        TabVisible = False
        object PnlCabecalhoCadastro: TPanel
          Left = 0
          Top = 0
          Width = 951
          Height = 80
          Align = alTop
          BevelOuter = bvNone
          Color = 16381682
          ParentBackground = False
          TabOrder = 0
          object LblTituloCadastro: TLabel
            Left = 24
            Top = 8
            Width = 90
            Height = 32
            Caption = 'Clientes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3221020
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblDescricaoCadastro: TLabel
            Left = 24
            Top = 48
            Width = 305
            Height = 17
            Caption = 'Use os filtros ou clique com o direito em um cliente.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
        end
        object PnlFiltros: TPanel
          Left = 0
          Top = 80
          Width = 951
          Height = 145
          Align = alTop
          BevelOuter = bvNone
          Color = 16381682
          ParentBackground = False
          TabOrder = 1
          object LblFiltroID: TLabel
            Left = 24
            Top = 4
            Width = 12
            Height = 17
            Caption = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblFiltroNome: TLabel
            Left = 112
            Top = 4
            Width = 36
            Height = 17
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblFiltroDocumento: TLabel
            Left = 449
            Top = 4
            Width = 63
            Height = 17
            Caption = 'CPF / CNPJ'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblFiltroCEP: TLabel
            Left = 762
            Top = 4
            Width = 22
            Height = 17
            Caption = 'CEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblFiltroEstado: TLabel
            Left = 24
            Top = 49
            Width = 40
            Height = 17
            Caption = 'Estado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblFiltroCidade: TLabel
            Left = 290
            Top = 49
            Width = 41
            Height = 17
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblFiltroNascimento: TLabel
            Left = 762
            Top = 49
            Width = 69
            Height = 17
            Caption = 'Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EdtFiltroID: TEdit
            Left = 24
            Top = 23
            Width = 72
            Height = 25
            MaxLength = 10
            TabOrder = 0
          end
          object EdtFiltroNome: TEdit
            Left = 112
            Top = 23
            Width = 323
            Height = 25
            MaxLength = 80
            TabOrder = 1
          end
          object EdtFiltroDocumento: TEdit
            Left = 449
            Top = 23
            Width = 291
            Height = 25
            MaxLength = 18
            TabOrder = 2
          end
          object EdtFiltroCEP: TEdit
            Left = 762
            Top = 23
            Width = 146
            Height = 25
            MaxLength = 9
            TabOrder = 3
          end
          object CbxFiltroEstado: TDBLookupComboBox
            Left = 24
            Top = 69
            Width = 250
            Height = 25
            KeyField = 'ID'
            ListField = 'NOME'
            ListSource = DtsEstados
            TabOrder = 4
            OnCloseUp = FiltroEstadoAlterado
          end
          object CbxFiltroCidade: TDBLookupComboBox
            Left = 290
            Top = 69
            Width = 450
            Height = 25
            KeyField = 'ID'
            ListField = 'NOME'
            ListSource = DtsCidadesFiltro
            TabOrder = 5
          end
          object DtpFiltroNascimento: TDateTimePicker
            Left = 762
            Top = 69
            Width = 164
            Height = 26
            Date = 46288.000000000000000000
            Format = 'dd/MM/yyyy'
            Time = 0.547595358795661000
            ShowCheckbox = True
            Checked = False
            TabOrder = 6
          end
          object PnlFiltrar: TPanel
            Left = 24
            Top = 100
            Width = 120
            Height = 36
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Filtrar'
            Color = 10779161
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 7
            TabStop = True
            OnClick = FiltrarClicar
            OnEnter = PainelEntrar
            OnExit = PainelSair
            OnMouseEnter = PainelEntrar
            OnMouseLeave = PainelSair
          end
          object PnlLimparFiltros: TPanel
            Left = 160
            Top = 100
            Width = 144
            Height = 36
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Limpar filtros'
            Color = 10779161
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 8
            TabStop = True
            OnClick = LimparFiltrosClicar
            OnEnter = PainelEntrar
            OnExit = PainelSair
            OnMouseEnter = PainelEntrar
            OnMouseLeave = PainelSair
          end
        end
        object GrdClientes: TDBGrid
          Left = 0
          Top = 225
          Width = 951
          Height = 514
          Align = alClient
          BorderStyle = bsNone
          DataSource = DtsClientes
          DrawingStyle = gdsGradient
          FixedColor = 15723744
          GradientEndColor = 15723744
          GradientStartColor = 15723744
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
          PopupMenu = MnuClientes
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = 3221020
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_CNPJ'
              Title.Caption = 'CPF / CNPJ'
              Width = 135
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE_NOME'
              Title.Caption = 'Cidade'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UF'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATANASCIMENTO'
              Title.Caption = 'Nascimento'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO'
              Title.Caption = 'N'#250'mero'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPLEMENTO'
              Title.Caption = 'Complemento'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRRO'
              Title.Caption = 'Bairro'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_NOME'
              Title.Caption = 'Estado'
              Width = 140
              Visible = True
            end>
        end
        object PnlRodapeCadastro: TPanel
          Left = 0
          Top = 739
          Width = 951
          Height = 48
          Align = alBottom
          BevelOuter = bvNone
          Color = 16381682
          ParentBackground = False
          TabOrder = 3
          object LblTotalClientes: TLabel
            AlignWithMargins = True
            Left = 777
            Top = 0
            Width = 150
            Height = 48
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 24
            Margins.Bottom = 0
            Align = alRight
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0 cliente(s)'
            Layout = tlCenter
            ExplicitLeft = 730
          end
        end
      end
      object AbaCadastro: TTabSheet
        Caption = 'Cadastrar cliente'
        TabVisible = False
        object PnlTituloFormulario: TPanel
          Left = 0
          Top = 0
          Width = 951
          Height = 88
          Align = alTop
          BevelOuter = bvNone
          Color = 16381682
          ParentBackground = False
          TabOrder = 0
          object LblTituloFormulario: TLabel
            Left = 24
            Top = 8
            Width = 192
            Height = 32
            Caption = 'Cadastrar cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3221020
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblDescricaoFormulario: TLabel
            Left = 24
            Top = 52
            Width = 318
            Height = 17
            Caption = 'Preencha os campos. Os itens com * s'#227'o obrigat'#243'rios.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
        end
        object ScrCadastro: TScrollBox
          Left = 0
          Top = 88
          Width = 951
          Height = 611
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 1
          object LblID: TLabel
            Left = 24
            Top = 24
            Width = 12
            Height = 17
            Caption = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblNome: TLabel
            Left = 220
            Top = 24
            Width = 45
            Height = 17
            Caption = 'Nome *'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblDocumento: TLabel
            Left = 24
            Top = 100
            Width = 72
            Height = 17
            Caption = 'CPF / CNPJ *'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblNascimento: TLabel
            Left = 348
            Top = 100
            Width = 131
            Height = 17
            Caption = 'Nascimento (opcional)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblCEP: TLabel
            Left = 24
            Top = 176
            Width = 31
            Height = 17
            Caption = 'CEP *'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblEndereco: TLabel
            Left = 190
            Top = 176
            Width = 55
            Height = 17
            Caption = 'Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblNumero: TLabel
            Left = 24
            Top = 252
            Width = 48
            Height = 17
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblComplemento: TLabel
            Left = 190
            Top = 252
            Width = 82
            Height = 17
            Caption = 'Complemento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblBairro: TLabel
            Left = 466
            Top = 252
            Width = 35
            Height = 17
            Caption = 'Bairro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblEstado: TLabel
            Left = 24
            Top = 328
            Width = 49
            Height = 17
            Caption = 'Estado *'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LblCidade: TLabel
            Left = 348
            Top = 328
            Width = 50
            Height = 17
            Caption = 'Cidade *'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8154463
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object EdtID: TEdit
            Left = 24
            Top = 48
            Width = 180
            Height = 25
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
            Text = 'Gerado ao salvar'
          end
          object EdtNome: TEdit
            Left = 220
            Top = 48
            Width = 520
            Height = 25
            MaxLength = 80
            TabOrder = 1
          end
          object EdtDocumento: TEdit
            Left = 24
            Top = 124
            Width = 300
            Height = 25
            MaxLength = 18
            TabOrder = 2
          end
          object DtpNascimento: TDateTimePicker
            Left = 348
            Top = 124
            Width = 200
            Height = 26
            Date = 46288.000000000000000000
            Format = 'dd/MM/yyyy'
            Time = 0.547595416668627900
            ShowCheckbox = True
            Checked = False
            TabOrder = 3
          end
          object EdtCEP: TEdit
            Left = 24
            Top = 200
            Width = 150
            Height = 25
            MaxLength = 9
            TabOrder = 4
          end
          object EdtEndereco: TEdit
            Left = 190
            Top = 200
            Width = 550
            Height = 25
            MaxLength = 100
            TabOrder = 5
          end
          object EdtNumero: TEdit
            Left = 24
            Top = 276
            Width = 150
            Height = 25
            MaxLength = 20
            TabOrder = 6
          end
          object EdtComplemento: TEdit
            Left = 190
            Top = 276
            Width = 260
            Height = 25
            MaxLength = 60
            TabOrder = 7
          end
          object EdtBairro: TEdit
            Left = 466
            Top = 276
            Width = 274
            Height = 25
            MaxLength = 100
            TabOrder = 8
          end
          object CbxEstado: TDBLookupComboBox
            Left = 24
            Top = 352
            Width = 300
            Height = 25
            KeyField = 'ID'
            ListField = 'NOME'
            ListSource = DtsEstados
            TabOrder = 9
            OnCloseUp = EstadoAlterado
          end
          object CbxCidade: TDBLookupComboBox
            Left = 348
            Top = 352
            Width = 392
            Height = 25
            KeyField = 'ID'
            ListField = 'NOME'
            ListSource = DtsCidades
            TabOrder = 10
          end
        end
        object PnlAcoesCadastro: TPanel
          Left = 0
          Top = 699
          Width = 951
          Height = 88
          Align = alBottom
          BevelOuter = bvNone
          Color = 16381682
          ParentBackground = False
          TabOrder = 2
          object LblCadastroSituacao: TLabel
            Left = 328
            Top = 16
            Width = 420
            Height = 56
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5525424
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object PnlSalvar: TPanel
            Left = 24
            Top = 20
            Width = 144
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Salvar cliente'
            Color = 10779161
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            TabStop = True
            OnClick = SalvarClicar
            OnEnter = PainelEntrar
            OnExit = PainelSair
            OnMouseEnter = PainelEntrar
            OnMouseLeave = PainelSair
          end
          object PnlCancelar: TPanel
            Left = 184
            Top = 20
            Width = 120
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Cancelar'
            Color = 10779161
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            TabStop = True
            OnClick = CancelarClicar
            OnEnter = PainelEntrar
            OnExit = PainelSair
            OnMouseEnter = PainelEntrar
            OnMouseLeave = PainelSair
          end
        end
      end
      object AbaRelatorio: TTabSheet
        Caption = 'Relat'#243'rio'
        TabVisible = False
        object LblSituacaoRelatorio: TLabel
          Left = 0
          Top = 739
          Width = 951
          Height = 48
          Align = alBottom
          AutoSize = False
          Layout = tlCenter
          WordWrap = True
          ExplicitTop = 736
          AlignWithMargins = True
          Margins.Left = 24
          Margins.Right = 24
        end
        object PnlFiltrosRelatorio: TPanel
          Left = 0
          Top = 0
          Width = 951
          Height = 224
          Align = alTop
          BevelOuter = bvNone
          Color = 16381682
          ParentBackground = False
          TabOrder = 0
          object LblTituloRelatorio: TLabel
            Left = 24
            Top = 12
            Width = 233
            Height = 32
            Caption = 'Relat'#243'rio de clientes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3221020
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblDescricaoRelatorio: TLabel
            Left = 24
            Top = 52
            Width = 700
            Height = 24
            AutoSize = False
            Caption = 'Filtre os clientes e visualize o relat'#243'rio para imprimir ou salvar em PDF.'
            Font.Color = 8154463
            ParentFont = False
          end
          object LblIDInicial: TLabel
            Left = 24
            Top = 88
            Width = 48
            Height = 17
            Caption = 'ID inicial'
          end
          object LblIDFinal: TLabel
            Left = 150
            Top = 88
            Width = 40
            Height = 17
            Caption = 'ID final'
          end
          object LblEstadoRelatorio: TLabel
            Left = 276
            Top = 88
            Width = 40
            Height = 17
            Caption = 'Estado'
          end
          object LblCidadeRelatorio: TLabel
            Left = 530
            Top = 88
            Width = 41
            Height = 17
            Caption = 'Cidade'
          end
          object EdtIDInicial: TEdit
            Left = 24
            Top = 112
            Width = 110
            Height = 25
            MaxLength = 10
            TabOrder = 0
          end
          object EdtIDFinal: TEdit
            Left = 150
            Top = 112
            Width = 110
            Height = 25
            MaxLength = 10
            TabOrder = 1
          end
          object CbxEstadoRelatorio: TDBLookupComboBox
            Left = 276
            Top = 112
            Width = 230
            Height = 25
            KeyField = 'ID'
            ListField = 'NOME'
            ListSource = DtsEstados
            TabOrder = 2
            OnCloseUp = EstadoRelatorioAlterado
          end
          object CbxCidadeRelatorio: TDBLookupComboBox
            Left = 530
            Top = 112
            Width = 230
            Height = 25
            KeyField = 'ID'
            ListField = 'NOME'
            ListSource = DtsCidadesRelatorio
            TabOrder = 3
          end
          object PnlFiltrarRelatorio: TPanel
            Left = 24
            Top = 168
            Width = 120
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Filtrar'
            Color = 10779161
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 4
            TabStop = True
            OnClick = FiltrarRelatorioClicar
            OnEnter = PainelEntrar
            OnExit = PainelSair
            OnMouseEnter = PainelEntrar
            OnMouseLeave = PainelSair
          end
          object PnlLimparFiltrosRelatorio: TPanel
            Left = 160
            Top = 168
            Width = 144
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Limpar filtros'
            Color = 10779161
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 5
            TabStop = True
            OnClick = LimparFiltrosRelatorioClicar
            OnEnter = PainelEntrar
            OnExit = PainelSair
            OnMouseEnter = PainelEntrar
            OnMouseLeave = PainelSair
          end
          object PnlVisualizarRelatorio: TPanel
            Left = 320
            Top = 168
            Width = 184
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Visualizar relat'#243'rio'
            Color = 10779161
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 6
            TabStop = True
            OnClick = VisualizarRelatorioClicar
            OnEnter = PainelEntrar
            OnExit = PainelSair
            OnMouseEnter = PainelEntrar
            OnMouseLeave = PainelSair
          end
          object PnlVoltarRelatorio: TPanel
            Left = 520
            Top = 168
            Width = 160
            Height = 40
            Cursor = crHandPoint
            BevelOuter = bvNone
            Caption = 'Voltar '#224' consulta'
            Color = 10779161
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 7
            TabStop = True
            OnClick = VoltarRelatorioClicar
            OnEnter = PainelEntrar
            OnExit = PainelSair
            OnMouseEnter = PainelEntrar
            OnMouseLeave = PainelSair
          end
        end
        object GrdRelatorio: TDBGrid
          AlignWithMargins = True
          Margins.Left = 24
          Margins.Right = 24
          Margins.Top = 12
          Margins.Bottom = 0
          BorderStyle = bsNone
          DrawingStyle = gdsGradient
          GradientStartColor = 15723744
          GradientEndColor = 15723744
          Left = 0
          Top = 176
          Width = 951
          Height = 563
          Align = alClient
          DataSource = DtsRelatorio
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = 3221020
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 210
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_CNPJ'
              Title.Caption = 'CPF / CNPJ'
              Width = 135
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRRO'
              Title.Caption = 'Bairro'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE_NOME'
              Title.Caption = 'Cidade'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_NOME'
              Title.Caption = 'Estado'
              Width = 145
              Visible = True
            end>
        end
      end
    end
  end
  object QryClientes: TFDQuery
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 240
    Top = 528
  end
  object DtsClientes: TDataSource
    AutoEdit = False
    DataSet = QryClientes
    Left = 240
    Top = 592
  end
  object QryEstados: TFDQuery
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 344
    Top = 528
  end
  object DtsEstados: TDataSource
    AutoEdit = False
    DataSet = QryEstados
    Left = 344
    Top = 592
  end
  object QryCidades: TFDQuery
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 448
    Top = 528
  end
  object DtsCidades: TDataSource
    AutoEdit = False
    DataSet = QryCidades
    Left = 448
    Top = 592
  end
  object QryCidadesFiltro: TFDQuery
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 552
    Top = 528
  end
  object DtsCidadesFiltro: TDataSource
    AutoEdit = False
    DataSet = QryCidadesFiltro
    Left = 552
    Top = 592
  end
  object MnuClientes: TPopupMenu
    AutoPopup = False
    Left = 680
    Top = 528
    object MniEditar: TMenuItem
      Caption = 'Editar cliente'
      OnClick = EditarCliente
    end
    object MniExcluir: TMenuItem
      Caption = 'Excluir cliente'
      OnClick = ExcluirCliente
    end
  end
  object QryRelatorio: TFDQuery
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 680
    Top = 592
  end
  object DtsRelatorio: TDataSource
    AutoEdit = False
    DataSet = QryRelatorio
    Left = 680
    Top = 656
  end
  object QryCidadesRelatorio: TFDQuery
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 792
    Top = 592
  end
  object DtsCidadesRelatorio: TDataSource
    AutoEdit = False
    DataSet = QryCidadesRelatorio
    Left = 792
    Top = 656
  end
end
