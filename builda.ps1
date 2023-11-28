FUNCTION Build {
	go build -ldflags="-s -w" -o="bin/"
}


$ENV:GOOS = "linux"
$ENV:GOARCH = "amd64"
Build

$ENV:GOOS = "windows"
$ENV:GOARCH = "amd64"
Build

$ENV:GOOS = "windows"
$ENV:GOARCH = "amd64"