# Windows Endpoint Investigation Case Study  
*Windows Fundamentals Part 1 — Evidence Analysis*

This case study documents a simulated investigation performed on a Windows endpoint as part of my Windows Fundamentals Part 1 training.  
The objective was to analyse user accounts, inspect running processes, review installed programs, examine system services, and interpret logon activity to identify potential security‑relevant events.

All referenced evidence is included in the `evidence/` directory of this repository.

---

# 📌 1. Initial System Enumeration

The investigation script (`scripts/windows-investigation.ps1`) collected baseline system information, including:

- Hostname  
- Logged‑in user  
- Domain/workgroup  
- System time  
- Local user accounts  
- Running processes  
- Installed programs  
- Security logon events  

This information is logged in:

```
evidence/system-check.log
```

### 🔍 Key Observations

- Logged in as **Administrator**  
- Hostname: `WIN-TEST01`  
- Domain: `WORKGROUP`  
- System time aligned with expected activity  

No anomalies were observed at this stage.

---

# 👥 2. Local User Account Analysis

Local user accounts were enumerated using:

```powershell
Get-LocalUser
```

Stored in:

```
evidence/user-accounts.txt
```

### 🔍 Notable Findings

- `Administrator` and `analyst` accounts are enabled  
- `Guest` is disabled (expected)  
- No unexpected admin‑level accounts  
- No recently created suspicious accounts  

### 🛡️ Assessment  
User account posture appears normal with no signs of privilege misuse.

---

# 🧵 3. Process Analysis

Running processes were captured using:

```powershell
Get-Process
```

Stored in:

```
evidence/process-list.txt
```

### 🔍 Notable Findings

- `MsMpEng` (Defender) active — expected  
- `explorer`, `svchost`, `RuntimeBroker` — normal Windows processes  
- No unknown executables  
- No high‑CPU anomalies  
- No suspicious command shells  

### 🛡️ Assessment  
Process activity appears clean and consistent with a healthy Windows system.

---

# ⚙️ 4. Service Enumeration

Services were enumerated using:

```powershell
Get-Service
```

Stored in:

```
evidence/services.txt
```

### 🔍 Key Services Observed

- Windows Firewall (MpsSvc) — running  
- Windows Defender (WinDefend) — running  
- Task Scheduler — running  
- RemoteRegistry — stopped (expected)  

### 🛡️ Assessment  
All core security services are active. No suspicious services were identified.

---

# 📦 5. Installed Programs Review

Installed programs were collected from registry uninstall keys and stored in:

```
evidence/installed-programs.txt
```

### 🔍 Notable Findings

- Google Chrome  
- Microsoft Edge  
- Python 3.12  
- Visual C++ Redistributables  
- 7‑Zip  

All publishers are legitimate.  
No unwanted software or unsigned applications were found.

---

# 🔐 6. Security Logon Event Review

Logon events were extracted from the Security event log and stored in:

```
evidence/security-logon-events.txt
```

### 🔍 Key Events Identified

- Successful interactive logon by `analyst`  
- UAC elevation event (expected for admin tasks)  
- One failed logon attempt — likely user error  
- No brute‑force patterns  
- No anomalous logon types  

### 🛡️ Assessment  
Authentication activity appears normal and consistent with administrative use.

---

# 🧩 7. Overall Security Assessment

Based on the evidence collected:

- No malicious processes detected  
- No suspicious services running  
- No unauthorised user accounts  
- Installed programs appear legitimate  
- Logon activity shows no signs of compromise  
- System behaviour matches expected baseline  

### 🛡️ Conclusion  
The system appears to be in a healthy state with **no indicators of compromise (IoCs)**.  
This investigation demonstrates practical Windows endpoint analysis skills aligned with SOC and incident response workflows.

---

# 🧠 8. Skills Demonstrated

This case study highlights experience with:

- Windows process analysis  
- Service enumeration  
- User account and privilege review  
- Installed program auditing  
- Security log interpretation  
- PowerShell‑based evidence collection  
- Endpoint triage methodology  

These are essential competencies for SOC analysts and cybersecurity professionals.
