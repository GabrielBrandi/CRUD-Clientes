param([switch]$LVisualizar)

$ErrorActionPreference = 'Stop'
$LRaiz = Split-Path -Parent $PSScriptRoot
$LNome = 'clientes_teste_' + [Guid]::NewGuid().ToString('N')
$LBanco = '/var/lib/firebird/data/' + $LNome + '.fdb'
$LArquivo = Join-Path ([IO.Path]::GetTempPath()) ($LNome + '.ini')
$LConfiguracaoAnterior = $env:CRUD_CONFIGURACAO
$LComando = 'export ISC_USER=$FIREBIRD_USER ISC_PASSWORD=$FIREBIRD_PASSWORD; exec /opt/firebird/bin/isql -b -q -ch UTF8'
$LConfiguracao = Get-Content -LiteralPath (Join-Path $LRaiz 'configuracao/aplicacao.ini') -Raw
$LConfiguracao = [regex]::Replace($LConfiguracao, '(?m)^Arquivo=.*$', 'Arquivo=' + $LBanco)
[IO.File]::WriteAllText($LArquivo, $LConfiguracao, [Text.UTF8Encoding]::new($false))

try {
  $LSQL = "CREATE DATABASE '$LBanco' DEFAULT CHARACTER SET UTF8;`nINPUT '/docker-entrypoint-initdb.d/001_estrutura.sql';`nINPUT '/docker-entrypoint-initdb.d/002_dados_iniciais.sql';`n"
  $LSQL | & docker compose --project-directory $LRaiz exec -T banco sh -c $LComando

  if ($LASTEXITCODE -ne 0) {
    throw 'Não foi possível criar o banco temporário de testes.'
  }

  $env:CRUD_CONFIGURACAO = $LArquivo
  $LArgumentos = @('-cadastro')

  if ($LVisualizar) {
    $LArgumentos += '-visualizar'
  }

  & (Join-Path $LRaiz 'bin/Win32/Clientes.Testes.exe') @LArgumentos

  if ($LASTEXITCODE -ne 0) {
    throw 'Falha no teste de cadastro e filtros.'
  }
}
finally {
  $env:CRUD_CONFIGURACAO = $LConfiguracaoAnterior
  "CONNECT '$LBanco';`nDROP DATABASE;" | & docker compose --project-directory $LRaiz exec -T banco sh -c $LComando

  if ($LASTEXITCODE -ne 0) {
    Write-Warning "Não foi possível remover o banco temporário $LBanco."
  }

  [IO.File]::Delete($LArquivo)
}
