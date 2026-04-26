# NTFS Overview — Windows File System

NTFS (New Technology File System) is the default file system used by modern Windows operating systems. It provides advanced features that support security, reliability, and access control.

---

## 📌 Key Features of NTFS

- **Permissions & ACLs** — granular control over who can access files and folders  
- **File compression** — reduces disk usage  
- **Encryption (EFS)** — protects sensitive data  
- **Journaling** — prevents corruption after crashes  
- **Large file support** — handles modern storage requirements  

---

## 📁 Critical NTFS Directories

### **C:\Windows**
Contains:
- System binaries  
- Drivers  
- System libraries  
- Configuration files  

### **C:\Users**
Contains:
- User profiles  
- Desktop, Documents, Downloads, etc.  

---

## 🛡️ Security Relevance

NTFS is central to Windows security because:

- Attackers often abuse weak permissions  
- Persistence can be hidden in system folders  
- ACL misconfigurations can allow privilege escalation  
- Forensics relies heavily on NTFS metadata  

Understanding NTFS is essential for Windows endpoint investigations.
