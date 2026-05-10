$projectRoot = Resolve-Path "$PSScriptRoot\.."
$pythonPath = Join-Path $projectRoot ".venv\Scripts\python.exe"
$appPath = Join-Path $projectRoot "app.py"
$stdoutPath = Join-Path $projectRoot "server.stdout.log"
$stderrPath = Join-Path $projectRoot "server.stderr.log"

Start-Process `
  -FilePath $pythonPath `
  -ArgumentList $appPath `
  -WorkingDirectory $projectRoot `
  -RedirectStandardOutput $stdoutPath `
  -RedirectStandardError $stderrPath
