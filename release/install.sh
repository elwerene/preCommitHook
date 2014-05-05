#!/bin/sh

function EXT_COLOR () {
    echo "\033[38;5;$1m";
}
NO_COLOR="\033[0m";

if [ ! -d '.git' ]; then
    echo "$(EXT_COLOR 196)git folder not found!$NO_COLOR";
    exec false;
fi

if [ ! -d '.git/hooks' ]; then
    echo "$(EXT_COLOR 196)githooks folder not found!$NO_COLOR";
    exec false;
fi

if [ -e '.git/hooks/pre-commit' ]; then
    echo "$(EXT_COLOR 196)There's already a pre-commit hook installed!$NO_COLOR";
    echo "$(EXT_COLOR 202)Please remove first:$NO_COLOR $(pwd)/.git/hooks/pre-commit";
    exec false;
fi

script="IyEvYmluL3NoCgpmdW5jdGlvbiBFWFRfQ09MT1IgKCkgewogICAgZWNobyAiXDAzM1szODs1OyQxbSI7Cn0KTk9fQ09MT1I9IlwwMzNbMG0iOwoKaWYgW1sgJCh1bmFtZSkgIT0gJ0RhcndpbicgXV07IHRoZW4KICAgIGVjaG8gIiQoRVhUX0NPTE9SIDIwMilXYXJuaW5nOiBnaXQgcHJlLWNvbW1pdCBob29rIG5vdCB5ZXQgdGVzdGVkIG9uICQodW5hbWUpISROT19DT0xPUiIKZmkKCmpzaGludD0kKHdoaWNoIGpzaGludCk7CmlmIFtbIC16ICRqc2hpbnQgXV07IHRoZW4KICAgIGVjaG8gIiQoRVhUX0NPTE9SIDE5NilFcnJvcjogTm8ganNoaW50IGV4ZWN1dGFibGUgZm91bmQhJE5PX0NPTE9SIjsKICAgIGV4ZWMgZmFsc2UKZmkKCnN0b3A9ZmFsc2U7CmZ1bmN0aW9uIGVycm9yIHsKICAgIGVjaG8gIiQoRVhUX0NPTE9SIDI0MikkMTpcdCQoRVhUX0NPTE9SIDE5NikkMiROT19DT0xPUiIKICAgIHN0b3A9dHJ1ZTsKfQoKZ2l0IGRpZmYgLS1jYWNoZWQgLS1uYW1lLW9ubHkgLS1kaWZmLWZpbHRlcj1BQ00gfCB3aGlsZSByZWFkIGZpbGU7IGRvCiAgICB0YWJzPSQoZ3JlcCAkJ1x0JyAiJGZpbGUifHdjIC1sfGF3ayB7J3ByaW50ICQxJ30pOwogICAgaWYgW1sgJHRhYnMgLW5lICcwJyBdXTsgdGhlbgogICAgICAgIGVycm9yICIkZmlsZSIgIiR0YWJzIGxpbmVzIHdpdGggdGFicyI7CiAgICBmaQoKICAgIGlmIFtbICR7ZmlsZSMjKi59ID09ICJqcyIgXV07IHRoZW4KICAgICAgICBqc3ZhbGlkPSQoJGpzaGludCAiJGZpbGUiIHx0YWlsIC1uIDEpOwogICAgICAgIGlmIFtbIC1uICIkanN2YWxpZCIgXV07IHRoZW4KICAgICAgICAgICAgZXJyb3IgIiRmaWxlIiAiY29udGFpbnMgaW52YWxpZCBqYXZhc2NyaXB0IGNvZGUgKCRqc3ZhbGlkKSI7CiAgICAgICAgZmkKICAgIGZpCmRvbmUKCmlmIFtbICRzdG9wID09IHRydWUgXV07IHRoZW4KICAgIGV4ZWMgZmFsc2UKZmkK"

echo $script | base64 -D > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "Installed git hook"
