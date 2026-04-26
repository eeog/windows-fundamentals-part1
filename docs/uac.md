# User Account Control (UAC)

User Account Control (UAC) is a Windows security feature that prevents unauthorized system changes by requiring elevation for administrative actions.

---

## 🔧 What UAC Does

- Prompts users before system‑level changes  
- Prevents silent privilege escalation  
- Helps contain malware running as Standard User  

---

## 🧱 UAC Prompt Levels

UAC can be configured to:

- Always notify  
- Notify only when apps try to make changes  
- Never notify (not recommended)  

---

## 🛡️ Security Relevance

Attackers often attempt to bypass UAC using:

- Auto‑elevating binaries  
- Token manipulation  
- Misconfigured executables  

Understanding UAC is essential for detecting privilege escalation attempts.
