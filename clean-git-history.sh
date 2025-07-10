#!/data/data/com.termux/files/usr/bin/bash

echo "🔎 بدء تنظيف تاريخ Git من الملفات الحساسة..."

# 1. الانتقال إلى مجلد المشروع (تأكد من تغيير المسار إذا لزم)
cd ~/ || exit

# 2. تنفيذ الفلترة لإزالة الملف الحساس
git filter-branch --force --index-filter \
"git rm --cached --ignore-unmatch smart-efis-global/.config/configstore/firebase-tools.json" \
--prune-empty --tag-name-filter cat -- --all

# 3. التحقق من نجاح العملية
if [ $? -eq 0 ]; then
  echo "✅ تم تنظيف التاريخ بنجاح."
  
  # 4. دفع التغييرات إلى GitHub بالقوة
  git push --force origin main
else
  echo "❌ فشل أثناء محاولة الفلترة. تحقق من المسار أو إعدادات Git."
fi
