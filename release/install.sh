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

script="IyEvYmluL3NoCgpmdW5jdGlvbiBFWFRfQ09MT1IgKCkgewogICAgZWNobyAiXDAzM1szODs1OyQxbSI7Cn0KTk9fQ09MT1I9IlwwMzNbMG0iOwoKaWYgW1sgJCh1bmFtZSkgIT0gJ0RhcndpbicgXV07IHRoZW4KICAgIGVjaG8gIiQoRVhUX0NPTE9SIDIwMilXYXJuaW5nOiBnaXQgcHJlLWNvbW1pdCBob29rIG5vdCB5ZXQgdGVzdGVkIG9uICQodW5hbWUpISROT19DT0xPUiI7CmZpCgpqc2hpbnQ9JCh3aGljaCBqc2hpbnQpOwppZiBbWyAteiAkanNoaW50IF1dOyB0aGVuCiAgICBlY2hvICIkKEVYVF9DT0xPUiAxOTYpRXJyb3I6IE5vIGpzaGludCBleGVjdXRhYmxlIGZvdW5kISROT19DT0xPUiI7CiAgICBleGVjIGZhbHNlCmZpCgpzdG9wQ29tbWl0PWZhbHNlOwpmdW5jdGlvbiBlcnJvciB7CiAgICBlY2hvICIkKEVYVF9DT0xPUiAyNDIpJDE6XHQkKEVYVF9DT0xPUiAxOTYpJDIkTk9fQ09MT1IiOwp9Cgp3aGlsZSByZWFkIGZpbGU7IGRvCiAgICBpZiBbWyAke2ZpbGUjIyoufSAhPSAicGxpc3QiICYmICR7ZmlsZSMjKi59ICE9ICJ6aXAiICAmJiAke2ZpbGUjIyoufSAhPSAibW9iaWxlcHJvdmlzaW9uIiBdXTsgdGhlbgogICAgICAgIHRhYnM9JChncmVwICQnXHQnICIkZmlsZSJ8d2MgLWx8YXdrIHsncHJpbnQgJDEnfSk7CiAgICAgICAgaWYgW1sgJHRhYnMgLW5lICcwJyBdXTsgdGhlbgogICAgICAgICAgICBlcnJvciAiJGZpbGUiICIkdGFicyBsaW5lcyB3aXRoIHRhYnMiOwogICAgICAgICAgICBzdG9wQ29tbWl0PXRydWU7CiAgICAgICAgZmkKICAgIGZpCgogICAgaWYgW1sgJHtmaWxlIyMqLn0gPT0gImpzIiBdXTsgdGhlbgogICAgICAgIGpzdmFsaWQ9JCgkanNoaW50ICIkZmlsZSIgfHRhaWwgLW4gMSk7CiAgICAgICAgaWYgW1sgLW4gIiRqc3ZhbGlkIiBdXTsgdGhlbgogICAgICAgICAgICBlcnJvciAiJGZpbGUiICJjb250YWlucyBpbnZhbGlkIGphdmFzY3JpcHQgY29kZSAoJGpzdmFsaWQpIjsKICAgICAgICAgICAgc3RvcENvbW1pdD10cnVlOwogICAgICAgIGZpCiAgICBmaQpkb25lIDw8PCAkKGdpdCBkaWZmIC0tY2FjaGVkIC0tbmFtZS1vbmx5IC0tZGlmZi1maWx0ZXI9QUNNKTsKCmlmIFtbICRzdG9wQ29tbWl0ID09IHRydWUgXV07IHRoZW4KICAgIGV4ZWMgZmFsc2U7CmZpCg=="

echo $script | base64 -D > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "Installed git hook"
