FUNCTION BUILD {
	PARAM (
		[PARAMETER(Mandatory=$TRUE, Position=0, HelpMessage="OS type")] [STRING]$OS,
		[PARAMETER(Mandatory=$TRUE, Position=1, HelpMessage="Architecture type")] [STRING]$ARCH
	)

	$OUTPATH = "bin/$PROJECT_NAME-$OS-$ARCH"
	IF ($OS -EQ "windows") {
		$OUTPATH = "$OUTPATH.exe"
	}

	$ENV:GOOS = $OS
	$ENV:GOARCH = $ARCH
	go build -gcflags=all="-l -B" -ldflags="-s -w" -trimpath -o="$OUTPATH"
}



$PROJECT_NAME = "mcods"

BUILD "linux" "386"
BUILD "linux" "amd64"

BUILD "windows" "386"
BUILD "windows" "amd64"