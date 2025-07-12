#!/data/data/com.termux/files/usr/bin/bash

echo "🚀 Smart EFIS Global - نشر موحد إلى GitHub + Firebase"

# 1. إعداد Git
git init
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/smart-efis-global.git

# 2. إضافة الملفات والالتزام
git add .
git commit -m "🚀 أول نشر تلقائي كامل"

# 3. الدفع إلى GitHub
git push -u origin main

# 4. نشر إلى Firebase
echo "🔥 نشر مباشر إلى Firebase..."
firebase deploy --project smart-efis-global

echo "✅ تم الدفع والنشر بنجاح!"
