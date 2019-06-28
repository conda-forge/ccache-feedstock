:: Windows recipe configuration copied from:
::  https://github.com/conda-forge/libffi-feedstock/pull/7/files#r66170877
copy "%RECIPE_DIR%\build-win.sh" .
bash -c "./build-win.sh"
