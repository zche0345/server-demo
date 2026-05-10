$projectRoot = Resolve-Path "$PSScriptRoot\.."
$pythonPath = Join-Path $projectRoot ".venv\Scripts\python.exe"
$appPath = Join-Path $projectRoot "app.py"
$stdoutPath = Join-Path $projectRoot "server.stdout.log"
$stderrPath = Join-Path $projectRoot "server.stderr.log"

Remove-Item Env:WERKZEUG_SERVER_FD -ErrorAction SilentlyContinue
Remove-Item Env:WERKZEUG_RUN_MAIN -ErrorAction SilentlyContinue
Remove-Item Env:FLASK_RUN_FROM_CLI -ErrorAction SilentlyContinue
Remove-Item Env:FLASK_DEBUG -ErrorAction SilentlyContinue

Start-Process `
  -FilePath $pythonPath `
  -ArgumentList $appPath `
  -WorkingDirectory $projectRoot `
  -RedirectStandardOutput $stdoutPath `
  -RedirectStandardError $stderrPath
