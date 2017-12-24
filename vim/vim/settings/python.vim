py3 import sys

function Py3test()
    py3 import time
    py3 from ctypes import *
    py3 lib = cdll.LoadLibrary("/usr/lib/libc.dylib")
    py3 print(time.ctime(lib.time(0)))
endfunction
" call Py3test()
