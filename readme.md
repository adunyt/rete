# Project Rete

### Launch

```
make run
```

### Build

```
make build
```

The binary is placed in `bin/rete` (`bin\rete.exe` on Windows).

`make clean` removes `bin` and the icon `.syso`. `make lint` runs golangci-lint.

### Windows

Requires `mingw32-make` (run it from cmd.exe or PowerShell) and `windres` (MinGW binutils) for the icon.

### Linux

Requires cgo: `gcc`, `pkg-config` and the dev packages for Gio. The pkg-config packages Gio needs:

```
wayland-client wayland-cursor wayland-egl egl x11 x11-xcb xcursor xfixes xkbcommon xkbcommon-x11
```

For Debian/Ubuntu see the `apt-get install` list in the "Install dependencies" step of [.github/workflows/ci.yml](.github/workflows/ci.yml).

### Windows release build

```
set GOAMD64=v3 && go build -gcflags="-B" -trimpath -ldflags="-s -w -H=windowsgui" -o bin\rete.exe cmd\main.go
```
