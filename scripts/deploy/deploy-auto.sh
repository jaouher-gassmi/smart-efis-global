#!/bin/bash
cd ~/smart-efis-global

# [0] التأكد من وجود repo
if [ ! -d .git ]; then
  git init
  git branch -M main
  git remote add origin https://github.com/jaouher-gassmi/smart-efis-global.git
fi

# [1] تنظيف مؤقت
echo "🧹 تنظيف الملفات المؤقتة..."
find . -name "*.DS_Store" -delete
rm -rf ./tmp/* 2>/dev/null

# [2] تنظيم ملفات garbage
echo "♻️  تنظيم ملفات garbage..."
mkdir -p .garbage/pending
find .garbage/added -type f -exec mv -n {} ./ \;

# [3] بناء (اختياري)
echo "🔧 بناء المشروع..."
npm run build 2>/dev/null || echo "⚠️ تخطيت البناء (npm غير مفعل)."

# [4] الدفع إلى GitHub
echo "🚀 دفع إلى GitHub..."
git add .
git commit -m "🚀 Updated: Auto push via deploy-auto.sh"
git push -u origin main

# [5] نشر (اختياري)
echo "🌐 نشر إلى Firebase/Netlify..."
# firebase deploy --only hosting
# netlify deploy --prod

echo "✅ كل شيء تم بنجاح."
