#!/data/data/com.termux/files/usr/bin/bash

echo "🔎 فحص حالة مشروع Firebase في Termux..."
echo "--------------------------------------------------"

# تحقق من وجود ملفات إعداد Firebase
if [ -f "firebase.json" ]; then
    echo "✅ تم تنفيذ firebase init hosting"
else
    echo "❌ لم يتم تنفيذ firebase init hosting بعد"
fi

# تحقق من ربط GitHub
if [ -f ".github/workflows/firebase-hosting-merge.yml" ]; then
    echo "✅ تم ربط GitHub وتهيئة النشر التلقائي (merge)"
else
    echo "❌ لم يتم إنشاء workflow للنشر بعد الدمج"
fi

if [ -f ".github/workflows/firebase-hosting-pull-request.yml" ]; then
    echo "✅ تم تفعيل المعاينة المسبقة عند فتح Pull Request"
else
    echo "❌ لم يتم تفعيل معاينة PR"
fi

# تحقق من مجلد public
if [ -d "public" ]; then
    echo "✅ تم إنشاء مجلد public للنشر"
    if [ -f "public/index.html" ]; then
        echo "   └── يحتوي على ملف index.html ✅"
    else
        echo "   └── لا يحتوي على index.html ❌"
    fi
else
    echo "❌ مجلد public غير موجود"
fi

# تحقق من ملفات Git
if [ -d ".git" ]; then
    echo "✅ تم تهيئة Git داخل المشروع"
    git remote -v | grep github >/dev/null && echo "   └── تم ربط مستودع GitHub ✅" || echo "   └── لم يتم ربط GitHub ❌"
else
    echo "❌ لم يتم تنفيذ git init بعد"
fi

echo "--------------------------------------------------"
echo "📍 انتهى التحليل."
