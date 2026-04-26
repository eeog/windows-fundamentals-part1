<# 
    ---------------------------------------------------------
    Windows Endpoint Investigation Script
    Windows Fundamentals Part 1 — Portfolio Demonstration
    ---------------------------------------------------------
    This script performs basic Windows endpoint enumeration,
    collects evidence, and writes results to the evidence/
    directory. It demonstrates practical skills relevant to
    SOC, IR, and endpoint analysis.
    ---------------------------------------------------------
#>

# Ensure evidence directory exists
$EvidenceDir = "evidence"
if (-not (Test-Path -Path $EvidenceDir)) {
    New-Item -ItemType Directory -Path $EvidenceDir | Out-Null
}

$LogFile = Join-Path $EvidenceDir "system-check.log"

Write-Output "[*] Starting Windows endpoint investigation..." | Tee-Object -FilePath $LogFile
Write-Output "--------------------------------------------------------" | Tee-Object -FilePath $LogFile -Append

# ---------------------------------------------------------
# 1. System & User Information
# ---------------------------------------------------------
Write-Output "`n[*] Collecting system and user information..." | Tee-Object -FilePath $LogFile -Append

$hostname = $env:COMPUTERNAME
$user     = $env:USERNAME
$domain   = $env:USERDOMAIN
$time     = Get-Date

Write-Output "Hostname: $hostname" | Tee-Object -FilePath $LogFile -Append
Write-Output "User: $user" | Tee-Object -FilePath $LogFile -Append
Write-Output "Domain: $domain" | Tee-Object -FilePath $LogFile -Append
Write-Output "Date: $time" | Tee-Object -FilePath $LogFile -Append

# ---------------------------------------------------------
# 2. Local User Accounts
# ---------------------------------------------------------
Write-Output "`n[*] Enumerating local user accounts..." | Tee-Object -FilePath $LogFile -Append

$UserAccountsFile = Join-Path $EvidenceDir "user-accounts.txt"
try {
    Get-LocalUser | Format-Table Name, Enabled, LastLogon -AutoSize | Out-String | Set-Content -Path $UserAccountsFile
    Write-Output "[+] Local user accounts saved to evidence/user-accounts.txt" | Tee-Object -FilePath $LogFile -Append
}
catch {
    Write-Output "[!] Failed to enumerate local users (requires appropriate privileges)." | Tee-Object -FilePath $LogFile -Append
}

# ---------------------------------------------------------
# 3. Running Processes
# ---------------------------------------------------------
Write-Output "`n[*] Capturing running processes..." | Tee-Object -FilePath $LogFile -Append

$ProcessFile = Join-Path $EvidenceDir "process-list.txt"
Get-Process | Sort-Object CPU -Descending | Select-Object -First 50 | `
    Format-Table Name, Id, CPU, WorkingSet -AutoSize | Out-String | Set-Content -Path $ProcessFile

Write-Output "[+] Top processes saved to evidence/process-list.txt" | Tee-Object -FilePath $LogFile -Append

# ---------------------------------------------------------
# 4. Services
# ---------------------------------------------------------
Write-Output "`n[*] Enumerating services..." | Tee-Object -FilePath $LogFile -Append

$ServicesFile = Join-Path $EvidenceDir "services.txt"
Get-Service | Sort-Object Status, DisplayName | `
    Format-Table Status, Name, DisplayName -AutoSize | Out-String | Set-Content -Path $ServicesFile

Write-Output "[+] Services list saved to evidence/services.txt" | Tee-Object -FilePath $LogFile -Append

# ---------------------------------------------------------
# 5. Installed Programs (Registry-based)
# ---------------------------------------------------------
Write-Output "`n[*] Enumerating installed programs..." | Tee-Object -FilePath $LogFile -Append

$InstalledProgramsFile = Join-Path $EvidenceDir "installed-programs.txt"

$UninstallPaths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

$Programs = foreach ($path in $UninstallPaths) {
    if (Test-Path $path) {
        Get-ItemProperty $path | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate
    }
}

$Programs | Where-Object { $_.DisplayName } | Sort-Object DisplayName | `
    Format-Table DisplayName, DisplayVersion, Publisher, InstallDate -AutoSize | `
    Out-String | Set-Content -Path $InstalledProgramsFile

Write-Output "[+] Installed programs saved to evidence/installed-programs.txt" | Tee-Object -FilePath $LogFile -Append

# ---------------------------------------------------------
# 6. Basic Security Event Log Summary (Logon Events)
# ---------------------------------------------------------
Write-Output "`n[*] Collecting recent logon events from Security log..." | Tee-Object -FilePath $LogFile -Append

$SecurityLogFile = Join-Path $EvidenceDir "security-logon-events.txt"

try {
    # 4624 = successful logon, 4625 = failed logon
    Get-WinEvent -LogName Security -MaxEvents 200 |
        Where-Object { $_.Id -in 4624, 4625 } |
        Select-Object TimeCreated, Id, LevelDisplayName, Message |
        Out-String | Set-Content -Path $SecurityLogFile

    Write-Output "[+] Security logon events saved to evidence/security-logon-events.txt" | Tee-Object -FilePath $LogFile -Append
}
catch {
    Write-Output "[!] Failed to query Security event log (requires elevated privileges)." | Tee-Object -FilePath $LogFile -Append
}

# ---------------------------------------------------------
# 7. Completion
# ---------------------------------------------------------
Write-Output "`n[*] Windows endpoint investigation completed." | Tee-Object -FilePath $LogFile -Append
Write-Output "Evidence written to: $EvidenceDir" | Tee-Object -FilePath $LogFile -Append
Write-Output "--------------------------------------------------------" | Tee-Object -FilePath $LogFile -Append
