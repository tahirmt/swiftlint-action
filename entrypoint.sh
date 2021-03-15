#!/bin/sh

apk update
apk add curl
apk add unzip

# Pull swiftlint
URL="https://github.com/realm/SwiftLint/releases/download/$1/swiftlint_linux.zip"
echo "$URL"
curl -LO "$URL"
unzip swiftlint_linux -d /swiftlint
ls
echo "$(pwd)"

ls /swiftlint

chmod +x /swiftlint/swiftlint
/swiftlint/swiftlint version