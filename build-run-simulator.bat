set game_bin="OdinHelloWorld"
set intermediate_dir="intermediate"
set output_dir="out"

odin build . -out=%intermediate_dir%/pdex.dll -build-mode:shared && \
%PLAYDATE_SDK_PATH%\bin\pdc %intermediate_dir% %output_dir%\%game_bin%.pdx && \
PlaydateSimulator %output_dir%\%game_bin%.pdx