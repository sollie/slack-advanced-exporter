#!/bin/bash

if [[ ! -d ./dist ]]; then
	mkdir ./dist
else
	rm -rf ./dist/*
fi

echo "Building macOS"
env GOOS=darwin GOARCH=amd64 go build .
tar -czf ./dist/slack-advanced-exporter.darwin-amd64.tar.gz slack-advanced-exporter
rm ./slack-advanced-exporter

echo "Building Linux"
env GOOS=linux GOARCH=amd64 go build .
tar -czf ./dist/slack-advanced-exporter.linux-amd64.tar.gz slack-advanced-exporter
rm ./slack-advanced-exporter

echo "Building Windows"
env GOOS=windows GOARCH=amd64 go build .
zip -q ./dist/slack-advanced-exporter.windows-amd64.zip slack-advanced-exporter.exe
rm ./slack-advanced-exporter.exe

sha256sum ./dist/slack-advanced-exporter.* > ./dist/checksums.txt