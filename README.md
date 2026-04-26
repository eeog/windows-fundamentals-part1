# Windows Fundamentals Part 1 — Endpoint Investigation Project

This project builds on my previous investigation work and expands it into the Windows ecosystem. It demonstrates practical skills used in security operations, including analysing user accounts, reviewing system configuration, understanding NTFS structure, inspecting user profiles, and examining running processes and system behaviour.

The goal of this project is to show my ability to investigate a Windows endpoint confidently — a core requirement for SOC analysts and cybersecurity professionals.

---

# 📌 Project Overview

This investigation covers:

- NTFS file system structure  
- Windows system directories (C:\Windows, C:\Users)  
- User accounts (Administrator vs Standard User)  
- User profile creation and structure  
- Local Users & Groups (lusrmgr.msc)  
- User Account Control (UAC)  
- Windows Settings vs Control Panel  
- Task Manager process and performance analysis  

Each section includes high‑level explanations, practical examples, and security relevance.

---

# 🗂️ 1. NTFS & Windows System Structure

Windows uses the **NTFS** file system, which supports:

- File permissions  
- Encryption  
- Compression  
- Journaling  
- Access control lists (ACLs)  

The core operating system files reside in:

```
C:\Windows
```

This directory contains:

- System binaries  
- Drivers  
- Configuration files  
- System libraries  

**Security relevance:**  
Attackers often target NTFS permissions, system folders, and ACL misconfigurations for persistence or privilege escalation.

---

# 👤 2. User Accounts (Administrator vs Standard User)

Windows supports two primary local account types:

### **Administrator**
- Full system control  
- Can install software  
- Can modify system settings  
- Can create/delete users  
- Can manage groups  

### **Standard User**
- Limited to personal files  
- Cannot install software  
- Cannot modify system‑level settings  

**Security relevance:**  
Least privilege is critical. Attackers frequently attempt to escalate from Standard User → Administrator.

---

# 🏠 3. User Profiles (C:\Users)

Each user has a profile stored in:

```
C:\Users\<username>
```

Common folders include:

- Desktop  
- Documents  
- Downloads  
- Pictures  
- Music  

Profiles are created on **first login**, handled by the **User Profile Service**.

**Security relevance:**  
User profiles often contain:

- Persistence mechanisms  
- Malicious scripts  
- Suspicious downloads  
- Artefacts of attacker activity  

---

# 👥 4. Local Users & Groups (lusrmgr.msc)

Local account management can be accessed via:

```
lusrmgr.msc
```

This interface allows:

- Viewing all local users  
- Viewing group memberships  
- Changing account types  
- Enabling/disabling accounts  

**Security relevance:**  
Analysts check for:

- Unexpected admin accounts  
- Disabled accounts re‑enabled  
- Accounts created without approval  

---

# 🔒 5. User Account Control (UAC)

UAC protects the system by requiring elevation for administrative actions.

Introduced in Windows Vista, UAC:

- Prevents silent privilege escalation  
- Prompts users before system‑level changes  
- Helps contain malware running as Standard User  

**Security relevance:**  
Attackers often attempt to bypass UAC using:

- Token manipulation  
- Auto‑elevating binaries  
- Misconfigured executables  

---

# ⚙️ 6. Windows Settings vs Control Panel

Windows provides two configuration interfaces:

### **Settings**
- Modern UI  
- User‑friendly  
- Limited administrative depth  

### **Control Panel**
- Legacy interface  
- Deep system configuration  
- Still required for many admin tasks  

**Security relevance:**  
Analysts must know both, as attackers often modify:

- Startup programs  
- Installed software  
- Network settings  
- User accounts  

---

# 📊 7. Task Manager — Process & Performance Analysis

Task Manager provides visibility into:

- Running processes  
- CPU usage  
- Memory usage  
- Startup programs  
- User sessions  
- Services  

**Security relevance:**  
Analysts use Task Manager to identify:

- Suspicious processes  
- Resource spikes  
- Unknown executables  
- Persistence mechanisms  

---

# 📂 Repository Structure

```bash
windows-fundamentals-part1/
│
├── README.md
│
├── docs/
│   ├── ntfs-overview.md
│   ├── user-accounts.md
│   ├── user-profiles.md
│   ├── lusrmgr.md
│   ├── uac.md
│   ├── settings-vs-controlpanel.md
│   ├── task-manager.md
│   └── case-study.md
│
├── scripts/
│   └── windows-investigation.ps1
│
└── evidence/
    ├── process-list.txt
    ├── services.txt
    ├── user-accounts.txt
    ├── installed-programs.txt
    └── system-check.log
```

---

# ✔️ Summary

This project demonstrates practical Windows endpoint investigation skills relevant to:

- SOC analysis  
- Incident response  
- Digital forensics  
- Endpoint security  
- System administration  

It forms the Windows counterpart to my Linux investigation series.

