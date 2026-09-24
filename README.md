# Controle de clientes

É necessário ter Windows, Docker Desktop iniciado e Delphi com VCL e FireDAC instalados.

No PowerShell, na pasta do projeto, execute:

```powershell
./scripts/iniciar-banco.ps1
./scripts/preparar-cliente.ps1
./scripts/compilar.ps1
./bin/Win32/CRUDClientes.exe
```

Os scripts iniciam o Firebird, criam o banco e a configuração local, preparam as DLLs e compilam a aplicação.

Se o Delphi não estiver no PATH, informe o caminho da IDE:

```powershell
./scripts/compilar.ps1 -LIDE 'C:/caminho/do/Delphi/bin/bds.exe'
```

Também é possível abrir `src/CRUDClientes.dproj` no Delphi e executar com F9.

Para ajustar a conexão, edite `configuracao/aplicacao.ini`. O banco usa a porta 3050 por padrão.

Para parar o banco:

```powershell
docker compose stop
```

Para iniciá-lo novamente, execute `docker compose start`.
