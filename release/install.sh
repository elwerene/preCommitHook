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

script="IyEvYmluL3NoCgpmdW5jdGlvbiBFWFRfQ09MT1IgKCkgewogICAgZWNobyAiXDAzM1szODs1OyQxbSI7Cn0KTk9fQ09MT1I9IlwwMzNbMG0iOwoKaWYgW1sgJCh1bmFtZSkgIT0gJ0RhcndpbicgXV07IHRoZW4KICAgIGVjaG8gIiQoRVhUX0NPTE9SIDIwMilXYXJuaW5nOiBnaXQgcHJlLWNvbW1pdCBob29rIG5vdCB5ZXQgdGVzdGVkIG9uICQodW5hbWUpISROT19DT0xPUiI7CmZpCgpqc2hpbnQ9JCh3aGljaCBqc2hpbnQpOwppZiBbWyAteiAkanNoaW50IF1dOyB0aGVuCiAgICBlY2hvICIkKEVYVF9DT0xPUiAxOTYpRXJyb3I6IE5vIGpzaGludCBleGVjdXRhYmxlIGZvdW5kISROT19DT0xPUiI7CiAgICBleGVjIGZhbHNlCmZpCgpzdG9wQ29tbWl0PWZhbHNlOwpmdW5jdGlvbiBlcnJvciB7CiAgICBlY2hvICIkKEVYVF9DT0xPUiAyNDIpJDE6XHQkKEVYVF9DT0xPUiAxOTYpJDIkTk9fQ09MT1IiOwp9CgpjZCAkKGdpdCByZXYtcGFyc2UgLS1zaG93LXRvcGxldmVsKTsKCndoaWxlIHJlYWQgZmlsZTsgZG8KICAgIGlmIFtbICR7ZmlsZSMjKi59ICE9ICJwbGlzdCIgJiYgJHtmaWxlIyMqLn0gIT0gInppcCIgICYmICR7ZmlsZSMjKi59ICE9ICJtb2JpbGVwcm92aXNpb24iIF1dOyB0aGVuCiAgICAgICAgdGFicz0kKGdyZXAgJCdcdCcgIiRmaWxlInx3YyAtbHxhd2sgeydwcmludCAkMSd9KTsKICAgICAgICBpZiBbWyAkdGFicyAtbmUgJzAnIF1dOyB0aGVuCiAgICAgICAgICAgIGVycm9yICIkZmlsZSIgIiR0YWJzIGxpbmVzIHdpdGggdGFicyI7CiAgICAgICAgICAgIHN0b3BDb21taXQ9dHJ1ZTsKICAgICAgICBmaQogICAgZmkKCiAgICBpZiBbWyAke2ZpbGUjIyoufSA9PSAianMiIF1dOyB0aGVuCiAgICAgICAganN2YWxpZD0kKCRqc2hpbnQgIiRmaWxlIiB8dGFpbCAtbiAxKTsKICAgICAgICBpZiBbWyAtbiAiJGpzdmFsaWQiIF1dOyB0aGVuCiAgICAgICAgICAgIGVycm9yICIkZmlsZSIgImNvbnRhaW5zIGludmFsaWQgamF2YXNjcmlwdCBjb2RlICgkanN2YWxpZCkiOwogICAgICAgICAgICBzdG9wQ29tbWl0PXRydWU7CiAgICAgICAgZmkKICAgIGZpCmRvbmUgPDw8ICQoZ2l0IGRpZmYgLS1jYWNoZWQgLS1uYW1lLW9ubHkgLS1kaWZmLWZpbHRlcj1BQ00pOwoKaWYgW1sgJHN0b3BDb21taXQgPT0gdHJ1ZSBdXTsgdGhlbgogICAgZXhlYyBmYWxzZTsKZmkK"

echo $script | base64 -D > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "Installed git hook"
