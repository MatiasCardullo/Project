@echo off
for %%F in ("%~1\*.*") do (
  for /f "tokens=1,2,3 delims=/ " %%A in ("%%~tF") do (
    if not exist "%~1\%%C" mkdir "%~1\%%C"
    if not exist "%~1\%%C\%%C-%%B" mkdir "%~1\%%C\%%C-%%B"
	echo n | move /-y "%%~fF" "%~1\%%C\%%C-%%B" >> NUL
  )
)
exit