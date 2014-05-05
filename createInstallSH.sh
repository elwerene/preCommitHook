#!/bin/sh

script=$(base64 pre-commit.sh)
sed "s/{{BASE64}}/$script/" install.template > release/install.sh
chmod +x release/install.sh
echo "done"
