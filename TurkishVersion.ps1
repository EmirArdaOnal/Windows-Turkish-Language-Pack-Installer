
########################################################
## Add English Language Pack to running Windows Image ##
########################################################

$Language = "tr-TR"
Add-WindowsCapability -Online -Name "Language.Basic~~~$Language~0.0.1.0"
Add-WindowsCapability -Online -Name "Language.Handwriting~~~$Language~0.0.1.0"
Add-WindowsCapability -Online -Name "Language.OCR~~~$Language~0.0.1.0"
Add-WindowsCapability -Online -Name "Language.Speech~~~$Language~0.0.1.0"
Set-WinUILanguageOverride -Language $Language
Set-WinUserLanguageList $Language -Force
Set-WinSystemLocale $Language
Set-Culture $Language

$Language = "tr-TR"
# Dil paketi indirme ve yükleme
Add-WindowsCapability -Online -Name "Language.Basic~~~$Language~0.0.1.0"
# İsteğe bağlı dil özelliklerini yükleyin
Add-WindowsCapability -Online -Name "Language.Handwriting~~~$Language~0.0.1.0"
Add-WindowsCapability -Online -Name "Language.OCR~~~$Language~0.0.1.0"
Add-WindowsCapability -Online -Name "Language.Speech~~~$Language~0.0.1.0"
# Sistem dilini yapılandırma
Set-WinUILanguageOverride -Language $Language
Set-WinUILanguageFallback -Language $Language
Set-WinUserLanguageList $Language -Force
Set-WinSystemLocale $Language
Set-Culture $Language

$LanguageList = Get-WinUserLanguageList
$LanguageList.Add("tr-TR")
Set-WinUserLanguageList $LanguageList -Force
if ($?) {
    Write-Host "Dil paketi başarıyla eklendi. Ayarlar kısmından dilin üstüne tıklayıp 'Seçenekler' ve sonra 'Dil paketini indir'e basınız."
} else {
    Write-Host "Dil paketi eklenirken bir hata oluştu."
}


# Yeniden başlatma gerekebilir
Restart-Computer
