#!/bin/bash
echo "Start APL entry.sh"
export Port=8080
export CodeLocation=/aplcode
export Threaded=0
export AllowHttpGet=1
export Logging=1

echo "Start APL interpreter"

echo "Print ev. variables:"
echo "MOD_NAME: ${MOD_NAME}"
echo "FUNC_HANDLER: ${FUNC_HANDLER}"
echo "FUNC_PORT: ${FUNC_PORT}"
echo "FUNC_TIMEOUT: ${FUNC_TIMEOUT}"

echo "What is at .dyalog folder"
ls -la /.dyalog

echo "What is at /aplcode folder"
ls -la /aplcode

echo "Ready to go:"

#/usr/bin/dyalog  -ride +s /kubelessapl/kubelessapl.dws 0<&-
/usr/bin/dyalog +s /kubelessapl/kubelessapl.dws 0<&-
exit 0