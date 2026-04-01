#!/usr/local/bin/bash

EMACSCMD=(emacs)
EMACSCLIENT=(emacsclient -c -s )

function start-java-emacs {
    JAVAMACS=true EVILMACS=true "${EMACSCMD[@]}" "--daemon=java" 
}

function start-evil-emacs {
    EVILMACS=true "${EMACSCMD[@]}" "--daemon=evil"
}

function emj {
    "${EMACSCLIENT[@]}" "$@" "." &
}
