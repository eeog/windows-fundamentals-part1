# User Accounts — Administrator vs Standard User

Windows supports two primary local account types, each with different privileges and security implications.

---

## 👑 Administrator Accounts

Administrators can:

- Install/uninstall software  
- Modify system settings  
- Create/delete users  
- Manage groups  
- Access all files on the system  

This level of access makes admin accounts a high‑value target for attackers.

---

## 👤 Standard User Accounts

Standard users can:

- Modify their own files  
- Change personal settings  
- Run applications (with restrictions)  

They **cannot**:

- Install software  
- Modify system‑level settings  
- Access other users’ data  

---

## 🔍 Identifying User Accounts

User accounts can be viewed via:

- **Settings → Accounts → Other Users**  
- **Control Panel → User Accounts**  
- **Local Users & Groups (lusrmgr.msc)**  
- **PowerShell:**  
  ```powershell
  Get-LocalUser
  ```

---

## 🛡️ Security Relevance

Analysts check for:

- Unexpected admin accounts  
- Disabled accounts re‑enabled  
- Accounts created without approval  
- Privilege escalation attempts  

User account analysis is a core part of Windows investigations.
