$ErrorActionPreference = 'Stop'

$registryPaths = @(
    'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel',
    'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu'
)

$desktopIcons = [ordered]@{
    'Bilgisayar'          = '{20D04FE0-3AEA-1069-A2D8-08002B30309D}'
    'Kullanici Dosyalari' = '{59031a47-3f72-44a7-89c5-5595fe6b30ee}'
    'Ag'                  = '{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}'
    'Geri Donusum Kutusu' = '{645FF040-5081-101B-9F08-00AA002F954E}'
    'Denetim Masasi'      = '{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}'
}

foreach ($registryPath in $registryPaths) {
    if (-not (Test-Path -LiteralPath $registryPath)) {
        New-Item -Path $registryPath -Force | Out-Null
    }

    foreach ($icon in $desktopIcons.GetEnumerator()) {
        New-ItemProperty `
            -Path $registryPath `
            -Name $icon.Value `
            -PropertyType DWord `
            -Value 0 `
            -Force | Out-Null
    }
}

if (-not ('DesktopIconInstaller.NativeMethods' -as [type])) {
    Add-Type -TypeDefinition @'
namespace DesktopIconInstaller
{
    using System;
    using System.Runtime.InteropServices;

    public static class NativeMethods
    {
        [DllImport("shell32.dll")]
        public static extern void SHChangeNotify(
            int eventId,
            uint flags,
            IntPtr item1,
            IntPtr item2
        );
    }
}
'@
}

[DesktopIconInstaller.NativeMethods]::SHChangeNotify(
    0x08000000,
    0x0000,
    [IntPtr]::Zero,
    [IntPtr]::Zero
)

Write-Host 'Masaustu sistem simgeleri etkinlestirildi.' -ForegroundColor Green

