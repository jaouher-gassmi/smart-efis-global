#!/data/data/com.termux/files/usr/bin/bash
echo '🛠️ تثبيت التبعيات...'
npm install

echo '🔨 بناء المشروع...'
npm run build

echo '✅ تم توليد مجلد dist/'
