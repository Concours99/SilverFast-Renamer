@echo off
REM Covering batch file for the PowerShell script RenSeq.ps1
REM If there was a way to have Windows invoke PowerShell like you would
REM run a program, this wouldn't be necessary.
REM
REM Copyright 2021, Wayne Geiser.
REM Contact the author at geiserw@gmail.com
REM
REM Configuration options
REM
REM  In what directory does the PowerShell script live?
set DIR=d:\Programs\SilverFast Application\Utilities

REM Start of the batch file.  Beware of changing anything beyond this line.
PowerShell -ExecutionPolicy Bypass -File "%DIR%\RenSeq.ps1" %*