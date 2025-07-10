echo "🔄 التأكد من إلغاء الوصول إلى Firebase..."

# 1. التأكد من تسجيل الخروج
firebase logout --force

# 2. حذف ملفات الربط والتكوين
rm -rf ~/.config/configstore/firebase-tools.json
rm -rf ~/.cache/firebase
rm -rf ~/.firebase
rm -rf ~/.firebaserc
rm -rf .firebaserc firebase.json .env

# 3. التأكد من عدم وجود حسابات متصلة
echo "📋 الحسابات المتصلة حالياً:"
firebase login:list || echo "✅ لا يوجد حسابات متصلة."

# 4. التأكد من عدم وجود مشروع نشط
echo "📋 المشروع النشط حالياً:"
firebase use || echo "✅ لا يوجد مشروع نشط."

# 5. عرض المشاريع المرتبطة (إن وُجدت)
echo "📋 المشاريع المرتبطة (إن وُجدت):"
firebase projects:list || echo "✅ لا يوجد مشاريع مرتبطة."

# 6. حذف أدوات Firebase CLI (اختياري)
# npm uninstall -g firebase-tools

echo "✅ تم التأكد من إلغاء الوصول الكامل إلى Firebase في Termux."
