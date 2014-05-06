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

script="IyEvYmluL3NoCgpmdW5jdGlvbiBFWFRfQ09MT1IgKCkgewogICAgZWNobyAiXDAzM1szODs1OyQxbSI7Cn0KTk9fQ09MT1I9IlwwMzNbMG0iOwoKaWYgW1sgJCh1bmFtZSkgIT0gJ0RhcndpbicgXV07IHRoZW4KICAgIGVjaG8gIiQoRVhUX0NPTE9SIDIwMilXYXJuaW5nOiBnaXQgcHJlLWNvbW1pdCBob29rIG5vdCB5ZXQgdGVzdGVkIG9uICQodW5hbWUpISROT19DT0xPUiI7CmZpCgpqc2hpbnQ9JCh3aGljaCBqc2hpbnQpOwppZiBbWyAteiAkanNoaW50IF1dOyB0aGVuCiAgICBlY2hvICIkKEVYVF9DT0xPUiAxOTYpRXJyb3I6IE5vIGpzaGludCBleGVjdXRhYmxlIGZvdW5kISROT19DT0xPUiI7CiAgICBleGVjIGZhbHNlCmZpCgpzdG9wQ29tbWl0PWZhbHNlOwpmdW5jdGlvbiBlcnJvciB7CiAgICBlY2hvICIkKEVYVF9DT0xPUiAyNDIpJDE6XHQkKEVYVF9DT0xPUiAxOTYpJDIkTk9fQ09MT1IiOwp9Cgpyb290PSQoZ2l0IHJldi1wYXJzZSAtLXNob3ctdG9wbGV2ZWwpOwoKd2hpbGUgcmVhZCBmaWxlOyBkbwogICAgaWYgW1sgJHtmaWxlIyMqLn0gIT0gInBsaXN0IiAmJiAke2ZpbGUjIyoufSAhPSAiemlwIiAgJiYgJHtmaWxlIyMqLn0gIT0gIm1vYmlsZXByb3Zpc2lvbiIgXV07IHRoZW4KICAgICAgICB0YWJzPSQoZ3JlcCAkJ1x0JyAiJHJvb3QvJGZpbGUifHdjIC1sfGF3ayB7J3ByaW50ICQxJ30pOwogICAgICAgIGlmIFtbICR0YWJzIC1uZSAnMCcgXV07IHRoZW4KICAgICAgICAgICAgZXJyb3IgIiRmaWxlIiAiJHRhYnMgbGluZXMgd2l0aCB0YWJzIjsKICAgICAgICAgICAgc3RvcENvbW1pdD10cnVlOwogICAgICAgIGZpCiAgICBmaQoKICAgIGlmIFtbICR7ZmlsZSMjKi59ID09ICJqcyIgXV07IHRoZW4KICAgICAgICBqc3ZhbGlkPSQoJGpzaGludCAiJHJvb3QvJGZpbGUiIHx0YWlsIC1uIDEpOwogICAgICAgIGlmIFtbIC1uICIkanN2YWxpZCIgXV07IHRoZW4KICAgICAgICAgICAgZXJyb3IgIiRmaWxlIiAiY29udGFpbnMgaW52YWxpZCBqYXZhc2NyaXB0IGNvZGUgKCRqc3ZhbGlkKSI7CiAgICAgICAgICAgIHN0b3BDb21taXQ9dHJ1ZTsKICAgICAgICBmaQogICAgZmkKZG9uZSA8PDwgImBnaXQgZGlmZiAtLWNhY2hlZCAtLW5hbWUtb25seSAtLWRpZmYtZmlsdGVyPUFDTWAiOwoKaWYgW1sgJHN0b3BDb21taXQgPT0gdHJ1ZSBdXTsgdGhlbgogICAgZXhlYyBmYWxzZTsKZmkK"

echo $script | base64 -D > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "Installed git hook"
