FUNCTION Build {
	PARAM (
		[Parameter(Mandatory=$true, Position=0, HelpMessage="Build file name")]
		[string]$filename
	)

	go build -ldflags="-s -w" -o="bin/mcods-$filename"
}


$ENV:GOOS = "linux"
$ENV:GOARCH = "amd64"
Build "linux-amd64"

$ENV:GOOS = "windows"
$ENV:GOARCH = "amd64"
Build "windows-amd64.exe"

$ENV:GOOS = "windows"
$ENV:GOARCH = "amd64"