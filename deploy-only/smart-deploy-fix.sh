#!/bin/bash
# Smart EFIS Auto-Fix & Deploy Script

echo "🔄 Checking project directory..."
if [ ! -f firebase.json ]; then
  echo "❌ firebase.json not found!"
  exit 1
fi

# التأكد من وجود مجلدات public للغتين
[ ! -d public/en ] && echo "⚠️ Missing public/en directory. Creating..." && mkdir -p public/en && echo '<h1>EN Placeholder</h1>' > public/en/index.html
[ ! -d public/ar ] && echo "⚠️ Missing public/ar directory. Creating..." && mkdir -p public/ar && echo '<h1>AR Placeholder</h1>' > public/ar/index.html

# إصلاح ملفات .firebaserc إذا لزم
if [ ! -f .firebaserc ]; then
  echo '{
  "projects": {
    "default": "smart-efis-global"
  }
}' > .firebaserc
  echo "✅ .firebaserc file created."
fi

# إصلاح مشكلة storage/podcasts
if [[ -d "$HOME/storage" && ! -d "$HOME/storage/podcasts" ]]; then
  echo "⚠️ Fixing storage/podcasts issue..."
  mkdir -p "$HOME/storage/podcasts"
  echo "✅ Created missing directory: ~/storage/podcasts"
fi

echo "🚀 Running firebase deploy..."
firebase deploy --only hosting || echo "❌ Firebase deploy failed. Please check configuration."

echo "✅ Auto-fix & deploy process finished."
