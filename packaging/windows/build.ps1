$RepoRoot = Convert-Path $PSScriptRoot
$NuGetDir = Join-Path $RepoRoot ".nuget"
$NuGetExe = Join-Path $NuGetDir "nuget.exe"

if (-not (Test-Path $NuGetDir))
{
    New-Item -ItemType Directory -Force -Path $NuGetDir | Out-Null
}

if (-not (Test-Path $NuGetExe)) {
    Write-Host 'Downloading nuget.exe to ' + $NuGetExe
    Invoke-WebRequest https://dist.nuget.org/win-x86-commandline/v4.1.0/nuget.exe -OutFile $NuGetExe
}

& $NuGetExe install packages.config -ExcludeVersion

.\WIX\tools\heat.exe dir ..\..\src\Hello.Portal\bin\Release\netcoreapp1.1\win10-x64\publish  -o Hello.Portal.wxi -scom -srd -sreg -svb6 -gg -ke -cg HelloPortalFiles -var env.HelloPortalDir