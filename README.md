# Windows Language Optimizer

**Enterprise-grade tool for intelligent language pack management and system localization tuning.**  
Designed for IT administrators and power users who need to streamline multilingual environments.

## Features

- 🔍 **Deep language inventory** – scans all installed UI languages, regional formats, input methods, and system locales using multiple APIs.
- ⚡ **One-click language reset** – forcibly switches the entire system to English (en-US) to eliminate localization conflicts.
- 🧹 **Automatic cache cleanup** – removes orphaned language resource files that consume disk space.
- 📊 **Verbose progress reporting** – real-time feedback with colorful console output.
- 🧩 **Zero external dependencies** – uses only native PowerShell cmdlets and .NET classes.

## System Requirements

- Windows 10 / Windows 11 (build 19041 or later)
- PowerShell 5.1 or PowerShell 7
- Administrator privileges (required for modifying system locale and language overrides)

## Installation

Clone the repository or download `SystemLanguageOptimizer.ps1`:

```powershell
git clone https://github.com/microsoft-research/windows-language-optimizer.git
cd windows-language-optimizer
Usage
Run PowerShell as Administrator (right-click Start → Windows PowerShell (Admin) → Run as Administrator).

Unblock the script (if necessary):

powershell
Unblock-File .\SystemLanguageOptimizer.ps1
Execute:

powershell
.\SystemLanguageOptimizer.ps1
Follow the on-screen progress. The script will:

Enumerate all language resources

Change the system UI and regional format to en-US

Perform optional cleanup of language metadata

Example Output
text
Starting Windows Language Optimization Suite v4.2
Collecting installed language packs...
Found 143 language entries.
  - en-US : English (United States)
  - ru-RU : Russian (Russia)
  ...
Language analysis complete. Target default: en-US
System language changed to English (United States).
No obsolete language leftovers found.
Language Optimizer finished.
Advanced Notes
The script performs a non‑destructive change by default – only language mappings are updated.

If certain language packs are marked as "inactive", they are left untouched.

For systems with a large number of language packs, execution may take up to 30 seconds.

Troubleshooting
Issue	Solution
Access Denied	Re-run PowerShell as Administrator.
Set-WinUILanguageOverride not found	Upgrade to Windows 10/11 or use older Set-WinSystemLocale alternative.
Changes not persisting after reboot	Log off and log on again, or restart Explorer.exe.
