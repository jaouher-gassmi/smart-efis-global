#!/data/data/com.termux/files/usr/bin/bash

# 🗓️ الحصول على التاريخ الحالي
DATE=$(date +%F)  # يعطي تنسيق: 2025-07-10

# 📁 مسار المشروع الحالي (غيره إذا لزم)
PROJECT_DIR="$PWD"

# 📁 اسم النسخة الاحتياطية
BACKUP_NAME="smart-efis-backup-$DATE.zip"

# 🚫 حذف مجلد .git إن وجد
if [ -d ".git" ]; then
  echo "🔁 حذف مجلد .git..."
  rm -rf .git
fi

# ✅ ضغط المشروع
echo "📦 ضغط المشروع إلى: $BACKUP_NAME"
zip -r "$BACKUP_NAME" .

# 📂 نقل الملف إلى ذاكرة الهاتف
echo "📁 نقل النسخة إلى /sdcard..."
mv "$BACKUP_NAME" /sdcard/

# 📢 إعلام المستخدم
echo "✅ تم حفظ النسخة في /sdcard/$BACKUP_NAME"
termux-toast "✅ Backup created: $BACKUP_NAME"
