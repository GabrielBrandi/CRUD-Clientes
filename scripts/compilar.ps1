param(
  [string]$LIDE = 'bds.exe',
  [switch]$LTestar,
  [switch]$LInterface
)

$ErrorActionPreference = 'Stop'
$LRaiz = Split-Path -Parent $PSScriptRoot
$LCaminhoIDE = (Get-Command $LIDE -ErrorAction Stop).Source
$LProjeto = Join-Path $LRaiz 'src/CRUDClientes.dproj'
$LExecutavel = Join-Path $LRaiz 'bin/Win32/CRUDClientes.exe'

if ($LTestar -or $LInterface) {
  $LProjeto = Join-Path $LRaiz 'testes/Clientes.Testes.dproj'
  $LExecutavel = Join-Path $LRaiz 'bin/Win32/Clientes.Testes.exe'
}

$LInicio = [DateTime]::UtcNow
$LProcesso = Start-Process -FilePath $LCaminhoIDE -ArgumentList '-b', ('"' + $LProjeto + '"') -WorkingDirectory (Split-Path -Parent $LProjeto) -WindowStyle Hidden -PassThru

while (-not $LProcesso.WaitForExit(1000)) {
  if ([DateTime]::UtcNow -gt $LInicio.AddMinutes(3)) {
    throw 'A IDE não concluiu a compilação. Abra o projeto no Delphi para consultar as mensagens.'
  }
}

if (-not (Test-Path -LiteralPath $LExecutavel)) {
  throw 'A IDE não gerou o executável. Consulte as mensagens de compilação no Delphi.'
}

if ((Get-Item -LiteralPath $LExecutavel).LastWriteTimeUtc -lt $LInicio) {
  throw 'O executável não foi atualizado por esta compilação.'
}

if ($LTestar -or $LInterface) {
  if ($LInterface) {
    & $LExecutavel '-interface'
  }
  else {
    & $LExecutavel
  }

  if ($LASTEXITCODE -ne 0) {
    throw "Falha nos testes: $LASTEXITCODE"
  }
}

Write-Host 'Compilação concluída.'
