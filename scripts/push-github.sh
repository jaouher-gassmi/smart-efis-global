#!/data/data/com.termux/files/usr/bin/bash

echo "🔗 بدء إعداد Git للمشروع..."

git init
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/smart-efis-global.git

echo "✅ جاهز للدفع. تنفيذ الأوامر التالية:"
echo "  git add ."
echo '  git commit -m "🚀 أول نشر للمشروع الذكي"'
echo "  git push -u origin main"
