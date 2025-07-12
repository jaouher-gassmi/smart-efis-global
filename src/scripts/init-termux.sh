#!/data/data/com.termux/files/usr/bin/bash

echo "🛠 بدء إعداد بيئة Smart EFIS Global..."

# تحديث النظام وتثبيت الأساسيات
pkg update -y && pkg upgrade -y
pkg install -y nodejs git unzip curl wget nano zip openssh

# تثبيت أدوات Node
npm install -g vite firebase-tools

# إعداد Git (يمكن تخصيصه)
git config --global user.name "SmartEFISUser"
git config --global user.email "user@example.com"

# تثبيت التبعيات
npm install

# عرض رسائل نجاح
echo "✅ تم إعداد البيئة بنجاح!"
echo "🟢 استخدم الأوامر التالية:"
echo "  - npm run dev       ← بدء خادم التطوير"
echo "  - npm run build     ← بناء المشروع"
echo "  - npm run deploy    ← نشر Firebase + Netlify"
echo "  - npm run clean     ← تنظيف البيئة"
