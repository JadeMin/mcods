$ENV:GOOS = "windows"
go build -ldflags="-s -w" -o="bin/"