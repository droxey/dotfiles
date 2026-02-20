# ⚡️ How To Use It

1. 📥 Drop files to organize into → `📁 iCloud Drive/Hazel Drop/`
2. 🤖 Hazel processes anything moved into → `📁 _INBOX (Staging)/`
3. ✅ Confident match → ➡️ filed into your structure (`📁 Clients/…` or `📁 Areas/…`)
4. ❌ Not confident → ➡️ sent to `📁 _REVIEW/…` for you to decide

# 📚 Rules

## Watch Folder: `Hazel Drop/`

1. D1 — Stage Everything  
   If: (any item)  
   Do: Move to `_INBOX (Staging)` → Stop

## Watch Folder: `_INBOX (Staging)/` (Process Subfolders + Apply To Folders)

2. I1 — Hidden/System → Review  
   If: name begins `.` or is `.DS_Store`  
   Do: Move to `_REVIEW/Unsorted`, comment `Hidden/system` → Stop

3. I2 — Screenshots → Review  
   If: name starts `Screenshot` or contains `Screen Shot`  
   Do: Move to `_REVIEW/Unsorted`, tag `Review`, comment `Screenshot` → Stop

4. I3 — Normalize Folder Names  
   If: item is folder under `_INBOX (Staging)`  
   Do: Replace `: / \ | ? *` → `-`; trim; collapse spaces; collapse dashes

5. I4 — Safe Normalize File Names  
   If: filename has illegal chars / double spaces / trailing space / `--`  
   Do: Replace `: / \ | ? *` → `-`; trim; collapse spaces; collapse dashes

6. I5 — Tag Messy Names  
   If: matches camera/download/copy patterns (IMG_####, Document(1), “copy”, etc.)  
   Do: Add tag `MessyName` (continue)

7. I6 — Client Route From Folder Path (`_INBOX/<Client>/<Project>/...`)  
   If: file is ≥2 levels deep under `_INBOX (Staging)`  
   Do: Clean “Short Desc”; if tag `MessyName` then rename to `Client - Project - Short Desc - YYYYMMDD.ext` (modified date); move to `Clients/<Client>/<Project>/`; conflicts → `_REVIEW/Conflicts` → Stop

8. I7 — `[Client]` Prefix But No Project → Review  
   If: name matches `^[Client] ...`  
   Do: Clean “Short Desc”; rename minimally to `DocType - Short Desc - YYYYMMDD.ext`; move to `_REVIEW/Needs Client-Project`, tag `Review` → Stop

9. I8 — Receipts/Finance → Areas/Finance  
   If: finance keywords (receipt/invoice/statement/tax/1099/W-2/etc.)  
   Do: Move to `Areas/Finance/` (optional subfolders by keyword); conflicts → `_REVIEW/Conflicts` → Stop

10. I9 — Final Catch → Minimal Rename + Review  
   If: (anything else)  
   Do: Clean “Short Desc”; rename to `DocType - Short Desc - YYYYMMDD.ext`; move to `_REVIEW/Unsorted`, tag `Review` → Stop

# 🔎 Tokens

- DocType: `PDF` if `.pdf`, else `Doc`
- YYYYMMDD: Modified date
- Short Desc cleaning: remove leading `[...]`, remove trailing `(1)`/`copy`, remove trailing dates