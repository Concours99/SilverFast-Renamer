<#
	Renaming script for use with Silverfast photo scanning
	software to append a '-' and a sequential number to each file
	scanned.
	
	Changing the Configuration parameters (variables that start with
	"$Config" will customize the opperation of the script
	
	Copyright 2021, Wayne Geiser.  All Rights Reserved.
	geiserw@gmail.com to contact author.
#>

# Configuration parameters
#
#  This is where the file to remember the next seqence number to rename
#  the output file resides.
#  Delete the file and numbering starts over at $ConfigSequenceStartNum.
#  Edit the file and change the number to whatever you wish.
#  Note that the ".\" creates a new copy for each directory into which
#  you scan files.
$ConfigSequenceFileName = ".\seqnum.txt"
#
#  This is the number to start counting from if the Sequence Number File
#  doesn't exist or if we get to the maximum number and have to restart
#  the count.
$ConfigSequenceStartNum = "1"
#
#  This is the number to increment each time.  I don't really see a need
#  to change this from the default of 1.
$ConfigIncrement = 1
#
#  This is the number of digits to format the number appended to the file
#  name
$ConfigNumberDigits = 5

# Start of the script.  Beware of changing anything beyond this line.
$origfile = $args -join " "
# The sequence file lives in the same directory as the file to be
# renamed
$seqfil = Split-Path -Path $origfile
if ($seqfil -eq "") {
	$seqfil = $ConfigSequenceFileName
}
else {
    $seqfil = $seqfil + $ConfigSequenceFileName
}
if (-not(Test-Path -Path $seqfil -PathType Leaf)) {
	# First time in this directory.  Start counting over.
	$seqnum = $ConfigSequenceStartNum
}
else {
    $seqnum = Get-Content -Path $seqfil
}
$seqnum = "{0:d$ConfigNumberDigits}" -f +$seqnum
# Keep incrementing if the file exists
DO {
    $newfile = $origfile -replace '(.+)(\.\w+)$', "`$1-$seqnum`$2"
	$seqnum = +$seqnum + $ConfigIncrement
    $seqnum = "{0:d$ConfigNumberDigits}" -f +$seqnum
}
Until (-not(Test-Path -Path $newfile -PathType Leaf))
# are we going to overflow the number of digits?
$maxnum = [Math]::Pow(10,$ConfigNumberDigits)-1
if (+$seqnum -gt $maxnum) {
    $seqnum = $ConfigSequenceStartNum
}
Rename-Item $origfile $newfile
# Save the new value in the seqnum file
Out-File -FilePath $seqfil -InputObject (+$seqnum)