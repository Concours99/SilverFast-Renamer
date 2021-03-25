# SilverFast Renamer
 
SilverFast Renamer is a PowerShell script and batch file to rename files
scanned and saved by SilverFast with an incrementing sequence number.

One thing I missed when I switched from using EPSON Scan to using SilverFast
was the ability to have an incrementing sequence number appended to the
filename of each graphic file saved by the software.

SilverFast has the ability to show the image after the scan is finished.  I
used this functionality to rename the file rather than view the contents of
the file.

## Installation

First, copy the following files to any directory you choose.  I installed
SilverFast to d:\Programs\SilverFast Application, so I created a folder there
called "Utilities".

* RenSeq.bat
* RenSeq.ps1

Second, edit RenSeq.bat to set the variable DIR to the folder in which you have
copied the above files.  Notice that my copy says
d:\Programs\SilverFast Application\Utilites

Third, in SilverFast, use the Edit>Preferences menu item (or hit Ctrl+,) to
bring up the preferences dialog.  In the General section, there is a setting
named "Show image after scan".  Check the box for that option and click on the
"..." button on the right hand side of this option.  Navigate to the folder
in which you copied the batch file.  You will have to type in the name of the
batch file (RenSeq.bat) because SilverFast only expects .exe files here.
Don't worry, it'll still work!

## Usage

After scanning any file, SilverFast will call this batch file with the file
name of the file it just created.  The batch file will call the PowerShell
script, which does all the heavy lifting.

The PowerShell script looks for a file (default: "seqnum.txt") in the folder
where the graphic gile was saved to get the number that should be added to the
end of the file name.  If the file containing the number doesn't exist, the
script starts at a defined value (default: 1).  It formats a new file name,
adding a file, padded with "0"s for a specified number of digits (default: 5)
and renames the file to that new name.

All of the items, above that have a default value indicated can be changed in
the configuration block at the top of the PowerShell script.

The number sequence file can be deleted to start over at the definied initial
value or it can be edited to continue at any other value you like.

Note that a number sequence file will be created in each folder into which
you scan photos.  Each directory will have its own counter.

## Questions / Suggestions

You can contact me at geiserw@gmail.com.  I make no promise to make any
alterations or implement any suggestions.