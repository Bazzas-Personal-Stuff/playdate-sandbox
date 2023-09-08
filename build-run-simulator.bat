REM Credit to Colin Bellino for the base Playdate build script.

@echo off
set game_bin=PlaydateSandbox
set intermediate_dir=intermediate
set output_dir=out

if not exist ".\%intermeidate_dir%" mkdir ".\%intermeidate_dir%"
if not exist ".\%output_dir%" mkdir ".\%output_dir%"

echo Compiling game dll from Odin source... && ^
odin build src -out=%intermediate_dir%/pdex.dll -build-mode:shared -debug && ^
echo Compiling Playdate Executable (pdx)... && ^
%PLAYDATE_SDK_PATH%\bin\pdc %intermediate_dir% %output_dir%\%game_bin%.pdx && ^
%PLAYDATE_SDK_PATH%\bin\PlaydateSimulator %output_dir%\%game_bin%.pdx
