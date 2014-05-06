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

script="IyEvYmluL2Jhc2gKCmZ1bmN0aW9uIEVYVF9DT0xPUiAoKSB7CiAgICBlY2hvICJcMDMzWzM4OzU7JDFtIjsKfQpOT19DT0xPUj0iXDAzM1swbSI7CgppZiBbWyAkKHVuYW1lKSAhPSAnRGFyd2luJyBdXTsgdGhlbgogICAgZWNobyAiJChFWFRfQ09MT1IgMjAyKVdhcm5pbmc6IGdpdCBwcmUtY29tbWl0IGhvb2sgbm90IHlldCB0ZXN0ZWQgb24gJCh1bmFtZSkhJE5PX0NPTE9SIjsKZmkKCmpzaGludD0kKHdoaWNoIGpzaGludCk7CmlmIFtbIC16ICRqc2hpbnQgXV07IHRoZW4KICAgIGVjaG8gIiQoRVhUX0NPTE9SIDE5NilFcnJvcjogTm8ganNoaW50IGV4ZWN1dGFibGUgZm91bmQhJE5PX0NPTE9SIjsKICAgIGV4ZWMgZmFsc2UKZmkKCnN0b3BDb21taXQ9ZmFsc2U7CmZ1bmN0aW9uIGVycm9yIHsKICAgIGVjaG8gIiQoRVhUX0NPTE9SIDI0MikkMTpcdCQoRVhUX0NPTE9SIDE5NikkMiROT19DT0xPUiI7Cn0KCnJvb3Q9JChnaXQgcmV2LXBhcnNlIC0tc2hvdy10b3BsZXZlbCk7Cgp3aGlsZSByZWFkIGZpbGU7IGRvCiAgICBpZiBbWyAke2ZpbGUjIyoufSAhPSAicGxpc3QiICYmICR7ZmlsZSMjKi59ICE9ICJ6aXAiICAmJiAke2ZpbGUjIyoufSAhPSAibW9iaWxlcHJvdmlzaW9uIiBdXTsgdGhlbgogICAgICAgIHRhYnM9JChncmVwICQnXHQnICIkcm9vdC8kZmlsZSJ8d2MgLWx8YXdrIHsncHJpbnQgJDEnfSk7CiAgICAgICAgaWYgW1sgJHRhYnMgLW5lICcwJyBdXTsgdGhlbgogICAgICAgICAgICBlcnJvciAiJGZpbGUiICIkdGFicyBsaW5lcyB3aXRoIHRhYnMiOwogICAgICAgICAgICBzdG9wQ29tbWl0PXRydWU7CiAgICAgICAgZmkKICAgIGZpCgogICAgaWYgW1sgJHtmaWxlIyMqLn0gPT0gImpzIiBdXTsgdGhlbgogICAgICAgIGpzdmFsaWQ9JCgkanNoaW50ICIkcm9vdC8kZmlsZSIgfHRhaWwgLW4gMSk7CiAgICAgICAgaWYgW1sgLW4gIiRqc3ZhbGlkIiBdXTsgdGhlbgogICAgICAgICAgICBlcnJvciAiJGZpbGUiICJjb250YWlucyBpbnZhbGlkIGphdmFzY3JpcHQgY29kZSAoJGpzdmFsaWQpIjsKICAgICAgICAgICAgc3RvcENvbW1pdD10cnVlOwogICAgICAgIGZpCiAgICBmaQpkb25lIDw8PCAiYGdpdCBkaWZmIC0tY2FjaGVkIC0tbmFtZS1vbmx5IC0tZGlmZi1maWx0ZXI9QUNNYCI7CgppZiBbWyAkc3RvcENvbW1pdCA9PSB0cnVlIF1dOyB0aGVuCiAgICBleGVjIGZhbHNlOwpmaQo="

echo $script | base64 -D > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "Installed git hook"
