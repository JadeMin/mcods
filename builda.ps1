FUNCTION Build {
	PARAM (
		[PARAMETER(Mandatory=$true, Position=0, HelpMessage="Architecture type")]
		[STRING]$ARCHTYPE
	)

	go build -ldflags="-s -w" -o="bin/mcods-$ARCHTYPE"
}


$ENV:GOOS = "linux"
$ENV:GOARCH = "amd64"
Build "linux-amd64"

$ENV:GOOS = "windows"
$ENV:GOARCH = "amd64"
Build "windows-amd64.exe"

$ENV:GOOS = "windows"
$ENV:GOARCH = "amd64"