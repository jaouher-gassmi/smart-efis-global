#!/data/data/com.termux/files/usr/bin/bash

echo '🔧 تثبيت التبعيات...'
npm install

echo '🛠️ بناء المشروع...'
npm run build

if [ -d "dist" ]; then
  echo '🔥 نشر إلى Firebase...'
  firebase deploy
  echo '✅ تم النشر بنجاح!'
else
  echo '❌ فشل: لم يتم العثور على مجلد dist/'
fi
