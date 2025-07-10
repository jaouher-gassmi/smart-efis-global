#!/data/data/com.termux/files/usr/bin/bash

# 🧠 إنشاء مجلدات إن لم تكن موجودة
mkdir -p ~/smart-efis-global/data
mkdir -p ~/smart-efis-global/cleaned

# 📥 إضافة أو تحديث البيانات (استبدال أو دمج مستقبلًا)
cat <<'EOF' > ~/smart-efis-global/data/data.json
[
  { "id": 1, "name": "EFIS A", "version": "v1.0", "score": 88, "date": "2024-05-01" },
  { "id": 1, "name": "EFIS A", "version": "v1.2", "score": 90, "date": "2024-07-01" },
  { "id": 2, "name": "EFIS B", "version": "v2.0", "score": 85, "date": "2024-06-01" },
  { "id": 2, "name": "EFIS B", "version": "v2.2", "score": 92, "date": "2024-06-20" }
]
EOF

# ⚙️ تشغيل المعالجة
python ~/smart-efis-global/scripts/process_data.py

# ✅ إعلام المستخدم
echo "✅ تمت إضافة البيانات ومعالجتها تلقائيًا. راجع cleaned/cleaned_data.json"
termux-toast "✔ Smart EFIS Data Updated & Processed"
