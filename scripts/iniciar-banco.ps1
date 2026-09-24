param([int]$LPorta = 3050)

$ErrorActionPreference = 'Stop'
$LRaiz = Split-Path -Parent $PSScriptRoot
$LAmbiente = Join-Path $LRaiz '.env'
$LConfiguracao = Join-Path $LRaiz 'configuracao/aplicacao.ini'

if (-not (Test-Path -LiteralPath $LAmbiente)) {
  $LSenhaAdministrador = [Guid]::NewGuid().ToString('N')
  $LSenhaBanco = [Guid]::NewGuid().ToString('N')
  $LConteudo = "SENHA_ADMINISTRADOR=$LSenhaAdministrador`nSENHA_BANCO=$LSenhaBanco`nPORTA_BANCO=$LPorta`n"
  [IO.File]::WriteAllText($LAmbiente, $LConteudo, [Text.UTF8Encoding]::new($false))
}

$LValores = @{}

foreach ($LLinha in Get-Content -LiteralPath $LAmbiente) {
  if ($LLinha -match '^([A-Z_]+)=(.*)$') {
    $LValores[$Matches[1]] = $Matches[2]
  }
}

if (-not $LValores['SENHA_BANCO'] -or -not $LValores['SENHA_ADMINISTRADOR']) {
  throw 'Preencha SENHA_BANCO e SENHA_ADMINISTRADOR no arquivo .env.'
}

if (-not (Test-Path -LiteralPath $LConfiguracao)) {
  $LConteudo = "[Banco]`nServidor=127.0.0.1`nPorta=$($LValores['PORTA_BANCO'])`nArquivo=/var/lib/firebird/data/clientes.fdb`nUsuario=CRUD_APP`nSenha=$($LValores['SENHA_BANCO'])`n"
  [IO.File]::WriteAllText($LConfiguracao, $LConteudo, [Text.UTF8Encoding]::new($false))
}

& docker compose --project-directory $LRaiz config --quiet

if ($LASTEXITCODE -ne 0) {
  throw 'A configuração do Docker Compose é inválida.'
}

& docker compose --project-directory $LRaiz up -d --wait --wait-timeout 90

if ($LASTEXITCODE -ne 0) {
  throw 'Não foi possível iniciar o banco. Consulte docker compose logs banco.'
}

Write-Host 'Firebird iniciado. A configuração local está em configuracao/aplicacao.ini.'
