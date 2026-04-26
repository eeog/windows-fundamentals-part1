# User Profiles — C:\Users Structure

Each Windows user has a dedicated profile stored in:

```
C:\Users\<username>
```

This folder is created automatically on first login by the **User Profile Service**.

---

## 📁 Common Profile Folders

- Desktop  
- Documents  
- Downloads  
- Pictures  
- Music  
- AppData (hidden)  

---

## 🧠 How Profiles Are Created

During first login, Windows displays messages such as:

- *Preparing Windows*  
- *User Profile Service*  

This process builds the user’s environment.

---

## 🛡️ Security Relevance

User profiles often contain:

- Suspicious downloads  
- Malicious scripts  
- Persistence mechanisms  
- Artefacts of attacker activity  

Investigators frequently inspect:

```
C:\Users\<user>\AppData\Roaming
C:\Users\<user>\AppData\Local
```

These locations are commonly abused by malware.
