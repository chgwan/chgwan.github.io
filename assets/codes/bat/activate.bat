@echo off
title KMS Activation Script
color 0A
echo =====================================================
echo          Windows and Office KMS Activation
echo =====================================================
echo.

:: Set Windows KMS Server
echo Setting Windows KMS Server...
slmgr /skms kms.03k.org
echo Activating Windows...
slmgr /ato
echo Windows activation completed.
echo.

:: Check Office Installation Directory
echo Detecting Microsoft Office installation path...
if exist "C:\Program Files\Microsoft Office\root\Office16" (
    cd "C:\Program Files\Microsoft Office\root\Office16"
) else if exist "C:\Program Files (x86)\Microsoft Office\root\Office16" (
    cd "C:\Program Files (x86)\Microsoft Office\root\Office16"
) else (
    echo Office installation not found!
    pause
    exit
)

:: Activate Office
echo Setting Office KMS Server...
cscript OSPP.VBS /sethst:kms.03k.org
echo Activating Office...
cscript OSPP.VBS /act

echo =====================================================
echo Activation process completed.
echo =====================================================
pause
exit
