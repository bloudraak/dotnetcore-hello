@if "%_echo%" neq "on" echo off
setlocal

if not defined VisualStudioVersion (
    if defined VS150COMNTOOLS (
        echo "Visual Studio 2017 detected"
        pushd "%VS150COMNTOOLS%"
        call "%VS150COMNTOOLS%\VsDevCmd.bat"
        popd
        goto :Run
    ) else if defined VS140COMNTOOLS (
        echo "Visual Studio 2015 detected"
        pushd "%VS140COMNTOOLS%"
        call "%VS140COMNTOOLS%\vsvars32.bat"
        popd
        goto :Run
    )
    echo Error: Visual Studio 2015 or higher is required.
    exit /b 1
)

:Run

set compress="C:\Program Files\7-Zip\7z.exe"

if [%BUILDNUMBER%]==[] set BUILDNUMBER=123
if [%VERSION%]==[] set VERSION=1.0.%BUILDNUMBER%
if [%BRANCH%]==[] set BRANCH=preview
if [%VersionPrefix%]==[] set VersionPrefix=%VERSION%
if [%VersionSuffix%]==[] set VersionSuffix=%BRANCH%

REM msbuild %~dp0Hello.sln /t:Clean 
REM msbuild %~dp0Hello.sln /t:Restore 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=win10-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%  
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=win7-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%  
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=win7-x86 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%  
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=win81-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%  
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=rhel.7.0-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=rhel.7.1-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=rhel.7.2-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=rhel.7.3-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=rhel.7.4-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=ubuntu.14.04-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=ubuntu.14.10-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=ubuntu.15.04-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=ubuntu.15.10-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=ubuntu.16.04-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=ubuntu.16.10-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=centos.7-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=debian.8-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=fedora.23-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=fedora.24-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix% 
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=opensuse.13.2-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=opensuse.42.1-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=ol.7.0-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=ol.7.1-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=ol.7.2-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=linuxmint.17.1-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=linuxmint.17.2-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=linuxmint.17.3-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=linuxmint.18-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=linuxmint.18-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=osx.10.10-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=osx.10.11-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%
REM msbuild %~dp0Hello.sln /t:Publish /m /p:Configuration=Release;RuntimeIdentifier=osx.10.12-x64 /p:VersionPrefix=%VersionPrefix% /p:VersionSuffix=%VersionSuffix%

if not exist %~dp0dist (
    mkdir %~dp0dist 
)

pushd %~dp0\src\Hello.Portal\bin\Release\netcoreapp1.1\win10-x64\publish
%compress% a -tzip %~dp0dist\hello-%VERSION%-win10-x64.zip .
popd