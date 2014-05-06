#!/bin/sh

function EXT_COLOR () {
    echo "\033[38;5;$1m";
}
NO_COLOR="\033[0m";

if [[ $(uname) != 'Darwin' ]]; then
    echo "$(EXT_COLOR 202)Warning: git pre-commit hook not yet tested on $(uname)!$NO_COLOR";
fi

jshint=$(which jshint);
if [[ -z $jshint ]]; then
    echo "$(EXT_COLOR 196)Error: No jshint executable found!$NO_COLOR";
    exec false
fi

stopCommit=false;
function error {
    echo "$(EXT_COLOR 242)$1:\t$(EXT_COLOR 196)$2$NO_COLOR";
}

cd $(git rev-parse --show-toplevel);

while read file; do
    if [[ ${file##*.} != "plist" && ${file##*.} != "zip"  && ${file##*.} != "mobileprovision" ]]; then
        tabs=$(grep $'\t' "$file"|wc -l|awk {'print $1'});
        if [[ $tabs -ne '0' ]]; then
            error "$file" "$tabs lines with tabs";
            stopCommit=true;
        fi
    fi

    if [[ ${file##*.} == "js" ]]; then
        jsvalid=$($jshint "$file" |tail -n 1);
        if [[ -n "$jsvalid" ]]; then
            error "$file" "contains invalid javascript code ($jsvalid)";
            stopCommit=true;
        fi
    fi
done <<< $(git diff --cached --name-only --diff-filter=ACM);

if [[ $stopCommit == true ]]; then
    exec false;
fi
