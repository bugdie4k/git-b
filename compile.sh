#!/usr/bin/env sh

RELATIVE=$(dirname $0)
ABSOLUTE=$(cd $RELATIVE && pwd)

BIN=$ABSOLUTE/bin
mkdir -p $BIN

if [ -z "$1" ]; then
    CNAME='git-b'
else
    CNAME="$1"
fi

CPATH=$BIN/$CNAME

python3 -c "import py_compile; py_compile.compile('git-b', cfile='$CPATH')"
RETCODE=$?

if [ $RETCODE -eq 0 ]; then    
    echo "Compiled to $RELATIVE/bin/$CNAME"
    chmod u+x $CPATH
else
    echo "Something went wrong (code $RETCODE)"
    exit $RETCODE
fi
