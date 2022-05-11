@echo off
for %%F in ("%~1\*.*") do (
  echo "%%F"
  move /-y "%%F" "%~1" >> NUL
)