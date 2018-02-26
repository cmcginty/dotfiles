" ensure python3 is compiled into vim
py3 import sys

function Py3test()
    py3 import time
    py3 from ctypes import *
    py3 lib = cdll.LoadLibrary("/usr/lib/libc.dylib")
    py3 print(time.ctime(lib.time(0)))
endfunction
" call Py3test()

" Enable jedi-vim virtualenv support by injecting active VIRTUAL_ENV into sys.path.
py3 << EOF
import os, sys, pathlib
if 'VIRTUAL_ENV' in os.environ:
    venv = os.getenv('VIRTUAL_ENV')
    site_packages = next(pathlib.Path(venv, 'lib').glob('python*/site-packages'))
    if site_packages:
        sys.path.insert(0, str(site_packages))
EOF
