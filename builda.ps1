FUNCTION BUILD {
	PARAM (
		[PARAMETER(Mandatory=$TRUE, Position=0, HelpMessage="OS type")] [STRING]$OS,
		[PARAMETER(Mandatory=$TRUE, Position=1, HelpMessage="Arch type")] [STRING]$ARCH
	)

	$OUTPATH = "bin/mcods-$OS-$ARCH"
	IF ($OS -EQ "windows") {
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