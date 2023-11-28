$ENV:GOOS = "linux"
go build -ldflags="-s -w" -o="bin/"
$ENV:GOOS = "windows"