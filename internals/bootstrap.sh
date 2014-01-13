# vim: ts=4 sw=4 sts=4 et

# GLOBAL VARS
runner=`basename $0`

function abort() {
    echo "ERROR: $*"
    exit 1
} 
