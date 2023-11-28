FUNCTION BUILD {
	PARAM (
		[PARAMETER(Mandatory=$true, Position=0, HelpMessage="OS type")] [STRING]$OS,
		[PARAMETER(Mandatory=$true, Position=1, HelpMessage="Arch type")] [STRING]$ARCH
	)

	$OUTPATH = "bin/mcods-$OS-$ARCH"
	IF ($OS -eq "windows") {
		$OUTPATH = "$OUTPATH.exe"
	}

	$ENV:GOOS = $OS
	$ENV:GOARCH = $ARCH
	go build -ldflags="-s -w" -o="$OUTPATH"
}



BUILD "linux" "386"
BUILD "linux" "amd64"

BUILD "windows" "386"
BUILD "windows" "amd64"