# Windows Desktop Icons Installer

Windows'ta aşağıdaki masaüstü sistem simgelerini tek komutla etkinleştirir:

- Bilgisayar
- Kullanıcı Dosyaları
- Ağ
- Geri Dönüşüm Kutusu
- Denetim Masası

## Kurulum

PowerShell'i normal kullanıcı olarak açın ve şu komutu çalıştırın:

```powershell
irm https://bygog.github.io/Windows-Desktop-Icons-Installer/install.ps1 | iex
```

Betik yalnızca geçerli kullanıcının `HKCU` kayıt defteri ayarlarını değiştirir. Yönetici yetkisi gerekmez.

## Güvenlik

İnternetten indirilen bir betiği çalıştırmadan önce içeriğini inceleyebilirsiniz:

```powershell
irm https://bygog.github.io/Windows-Desktop-Icons-Installer/install.ps1
```

