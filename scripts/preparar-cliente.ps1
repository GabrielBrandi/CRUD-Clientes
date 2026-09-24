$ErrorActionPreference = 'Stop'
$LRaiz = Split-Path -Parent $PSScriptRoot
$LDestino = Join-Path $LRaiz 'bin/Win32'
$LArquivo = Join-Path ([IO.Path]::GetTempPath()) 'CRUD-Clientes-Firebird-3.0.14-Win32.zip'
$LResumo = 'CE79BDFE00C582590C22D82B6A8261F308E2890DE0F53E435D5A6B1588679282'
$LEndereco = 'https://github.com/FirebirdSQL/firebird/releases/download/v3.0.14/Firebird-3.0.14.33856-0-Win32.zip'

if (-not (Test-Path -LiteralPath $LArquivo)) {
  Invoke-WebRequest -Uri $LEndereco -OutFile $LArquivo
}

if ((Get-FileHash -LiteralPath $LArquivo -Algorithm SHA256).Hash -ne $LResumo) {
  throw 'O pacote do cliente Firebird não corresponde ao resumo SHA-256 esperado.'
}

New-Item -ItemType Directory -Force -Path $LDestino | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem
$LPacote = [IO.Compression.ZipFile]::OpenRead($LArquivo)

try {
  foreach ($LNome in @('fbclient.dll', 'firebird.msg', 'msvcp100.dll', 'msvcr100.dll', 'zlib1.dll', 'IDPLicense.txt', 'IPLicense.txt')) {
    $LEntrada = $LPacote.GetEntry($LNome)

    if ($null -eq $LEntrada) {
      throw "Arquivo ausente no pacote: $LNome"
    }

    [IO.Compression.ZipFileExtensions]::ExtractToFile($LEntrada, (Join-Path $LDestino $LNome), $true)
  }
}
finally {
  $LPacote.Dispose()
}

Write-Host 'Cliente Firebird 3.0 de 32 bits preparado em bin/Win32.'
