#!/usr/bin/env bash


ROOT_DIR="$(cd `dirname $0`; pwd)"
OUTPUT="${OUTPUT:-/tmp/cross-compile.out}"

set -x
export CGO_ENABLED=1
export CC="zigcc"
export CXX="zigcxx"

cd "${ROOT_DIR}/go-demo" && go build -ldflags="-v"

if [ $? -eq 0 ]; then
  echo "| ${GOOS} | ${GOARCH} | ✅ |" >> $OUTPUT
else
  echo "| ${GOOS} | ${GOARCH} | ❌ |" >> $OUTPUT
fi
