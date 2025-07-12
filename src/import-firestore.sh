#!/data/data/com.termux/files/usr/bin/bash

echo "🚀 بدء استيراد البيانات إلى Firestore..."

# التأكد من تنصيب الأدوات
if ! command -v node &> /dev/null; then
  echo "❌ Node.js غير مثبت. الرجاء تثبيته أولاً."
  exit 1
fi

# إنشاء مشروع node للتنفيذ المؤقت
mkdir -p firestore_import && cd firestore_import
npm init -y > /dev/null
npm install firebase-admin > /dev/null

# إنشاء ملف تنفيذ
cat <<EOF > import.js
const admin = require("firebase-admin");
const fs = require("fs");

const serviceAccount = require("../firebase-admin-key.json"); // تأكد من وجود الملف

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();
const seedData = JSON.parse(fs.readFileSync("../firestore.seed.json", "utf8"));

(async () => {
  for (const [collection, docs] of Object.entries(seedData)) {
    for (const doc of docs) {
      const ref = db.collection(collection).doc(doc.id || undefined);
      await ref.set(doc);
      console.log(\`✅ تم إدخال → \${collection}/\${doc.id || '[auto-id]'}\`);
    }
  }
  console.log("🎉 اكتمل استيراد جميع البيانات.");
})();
EOF

# تنفيذ الاستيراد
node import.js

# حذف الملفات المؤقتة
cd ..
rm -rf firestore_import
