# Windows Desktop Icons Installer

[Türkçe](#türkçe) · [English](#english)

## Türkçe

Windows'ta aşağıdaki masaüstü sistem simgelerini tek komutla etkinleştirir:

- Bilgisayar
- Kullanıcı Dosyaları
- Ağ
- Geri Dönüşüm Kutusu
- Denetim Masası

### Kurulum

PowerShell'i normal kullanıcı olarak açın ve şu komutu çalıştırın:

```powershell
irm https://bygog.github.io/Windows-Desktop-Icons-Installer/install.ps1 | iex
```

Betik yalnızca geçerli kullanıcının `HKCU` kayıt defteri ayarlarını değiştirir. Yönetici yetkisi gerekmez.

### Güvenlik

İnternetten indirilen bir betiği çalıştırmadan önce içeriğini inceleyebilirsiniz:

```powershell
irm https://bygog.github.io/Windows-Desktop-Icons-Installer/install.ps1
```

## English

Enables the following Windows desktop system icons with a single command:

- This PC
- User's Files
- Network
- Recycle Bin
- Control Panel

### Installation

Open PowerShell as a standard user and run:

```powershell
irm https://bygog.github.io/Windows-Desktop-Icons-Installer/install.ps1 | iex
```

The script changes only the current user's `HKCU` registry settings. Administrator privileges are not required.

### Security

You can inspect the downloaded script before running it:

```powershell
irm https://bygog.github.io/Windows-Desktop-Icons-Installer/install.ps1
```
