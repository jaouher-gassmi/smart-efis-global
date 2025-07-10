#!/data/data/com.termux/files/usr/bin/bash

echo "🚀 بدء إعداد Smart EFIS..."

# 🗂️ إنشاء .firebaserc
echo "📄 إعداد .firebaserc..."
cat > .firebaserc <<EOF
{
  "projects": {
    "default": "smart-efis-global"
  }
}
EOF

# 🔧 إنشاء firebase.json
echo "📄 إعداد firebase.json..."
cat > firebase.json <<EOF
{
  "hosting": [
    {
      "target": "en",
      "public": "public/en",
      "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
      "rewrites": [{ "source": "**", "destination": "/index.html" }]
    },
    {
      "target": "ar",
      "public": "public/ar",
      "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
      "rewrites": [{ "source": "**", "destination": "/index.html" }]
    }
  ]
}
EOF

# 📁 إنشاء المجلدات إن لم تكن موجودة
mkdir -p public/en public/ar

# 🧪 ملفات HTML تجريبية إن لم تكن موجودة
if [ ! -f public/en/index.html ]; then
  echo "<!DOCTYPE html><html lang='en'><head><title>Smart EFIS EN</title></head><body><h1>Welcome EN</h1></body></html>" > public/en/index.html
fi
if [ ! -f public/ar/index.html ]; then
  echo "<!DOCTYPE html><html lang='ar'><head><title>Smart EFIS AR</title></head><body><h1>مرحبًا AR</h1></body></html>" > public/ar/index.html
fi

# 🏷️ ربط المشروع بالأهداف
echo "🔗 ربط الأهداف..."
firebase target:apply hosting en public/en
firebase target:apply hosting ar public/ar

# 🚀 النشر
echo "📤 نشر إلى Firebase Hosting..."
firebase deploy --only hosting
