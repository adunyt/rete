.PHONY: build run clean lint
.DEFAULT_GOAL := build

ifeq ($(OS),Windows_NT)
.PHONY: icon

icon:
	windres -F pe-x86-64 -O coff -I assets/icon -i assets/icon/rete.rc -o cmd/rsrc_windows_amd64.syso

build: icon
	go build -o bin/rete.exe ./cmd

clean:
	@if exist bin rmdir /s /q bin
	@if exist cmd\rsrc_windows_amd64.syso del cmd\rsrc_windows_amd64.syso
else
build:
	go build -o bin/rete ./cmd

clean:
	rm -rf bin
	rm -f cmd/rsrc_windows_amd64.syso
endif

run:
	go run ./cmd

lint:
	golangci-lint run ./...
