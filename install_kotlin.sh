#!/bin/bash

# This script runs inside the Judgehost chroot to isntall Kotlin compiler

set -e

KOTLIN_VERSION="2.2.20"
KOTLIN_ZIP="kotlin-compiler-${KOTLIN_VERSION}.zip"
KOTLIN_HOME="/opt/kotlin"

apt-get update
apt-get install -y curl unzip openjdk-17-jdk

curl -fL "https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/${KOTLIN_ZIP}" -o "/tmp/kotlin-compiler.zip"
unzip "/tmp/kotlin-compiler.zip" -d /opt

mv "/opt/kotlin-compiler-${KOTLIN_VERSION}" "${KOTLIN_HOME}"

ln -s "${KOTLIN_HOME}/bin/kotlinc" /usr/bin/kotlinc
ln -s "${KOTLIN_HOME}/bin/kotlin" /usr/bin/kotlin

rm /tmp/kotlin-compiler.zip
apt-get purge -y --auto-remove curl unzip
apt-get clean
rm -rf /var/lib/apt/lists/*