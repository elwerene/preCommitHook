#!/bin/sh

function EXT_COLOR () {
    echo "\033[38;5;$1m";
}
NO_COLOR="\033[0m";

if [[ $(uname) != 'Darwin' ]]; then
    echo "$(EXT_COLOR 202)Warning: git pre-commit hook not yet tested on $(uname)!$NO_COLOR"
fi

jshint=$(which jshint);
if [[ -z $jshint ]]; then
    echo "$(EXT_COLOR 196)Error: No jshint executable found!$NO_COLOR";
    exec false
fi

stop=false;
function error {
    echo "$(EXT_COLOR 242)$1:\t$(EXT_COLOR 196)$2$NO_COLOR"
    stop=true;
}

git diff --cached --name-only --diff-filter=ACM | while read file; do
    tabs=$(grep $'\t' "$file"|wc -l|awk {'print $1'});
    if [[ $tabs -ne '0' ]]; then
        error "$file" "$tabs lines with tabs";
    fi

    if [[ ${file##*.} == "js" ]]; then
        jsvalid=$($jshint "$file" |tail -n 1);
        if [[ -n "$jsvalid" ]]; then
            error "$file" "contains invalid javascript code ($jsvalid)";
        fi
    fi
done

if [[ $stop == true ]]; then
    error "WTF" "$stop"
    exec false
fi
