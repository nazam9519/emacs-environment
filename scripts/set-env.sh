THISOS="$(uname)"
OPNCMD=()
if [[ "$THISOS" == "Darwin" ]]; then
    OPNCMD=(open -a)
fi
alias et="emacs -nw"
alias edt="emacs -nw ."

CMD=("${OPNCMD[@]}" emacs)

function ed {
    echo "OpenCMD: $OPNCMD"
    "${CMD[@]}" "$@" &
}


function edr {
    echo "OpenCMD: $OPNCMD"
    "${CMD[@]}" "$@" "." &
}

function edj {
    echo "OpenCMD: $OPNCMD"
    #export JAVAMACS=true
    #export EVILMACS=true
    JAVAMACS=true EVILMACS=true "${CMD[@]}" "$@" &
    #unset JAVAMACS
    #unset EVILMACS
}
function edrj {
    echo "OpenCMD: $OPNCMD"
    #export JAVAMACS=true
    #export EVILMACS=true
    JAVAMACS=true EVILMACS=true "${CMD[@]}" "$@" "." &
    #unset JAVAMACS
    #unset EVILMACS
}
