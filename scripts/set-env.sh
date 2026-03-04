THISOS="$(uname)"
OPNCMD=()
if [[ "$THISOS" == "Darwin" ]]; then
    echo "mac"
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
    "${CMD[@]}" "$@" &
}
