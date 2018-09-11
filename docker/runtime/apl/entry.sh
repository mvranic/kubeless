#!/bin/bash
export Port=8080
export CodeLocation=/aplcode
export Threaded=0
export AllowHttpGet=1
export Logging=1

/usr/bin/dyalog  -ride +s /kubelessapl/kubelessapl.dws 0<&-
exit 0