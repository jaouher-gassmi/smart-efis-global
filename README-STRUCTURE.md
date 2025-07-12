# Smart EFIS Global (SEF) - مشروع مهيكل مختصر

تمت إعادة هيكلة أسماء المجلدات لتسهيل الوصول وتقليل التكرار.

## 📁 المجلدات المختصرة

| الاسم الأصلي       | الاسم المختصر | الوصف                          |
|--------------------|----------------|---------------------------------|
| scripts/           | src/           | سكربتات التنفيذ والنشر         |
| components/        | cmp/           | مكونات React                   |
| features/          | mod/           | الميزات (auth, ai-assist...)   |
| config/            | cfg/           | إعدادات (مثل اللغة)            |
| hooks/             | hk/            | هوكات React                    |
| public/en/         | public/e/      | واجهة اللغة الإنجليزية         |
| public/ar/         | public/a/      | واجهة اللغة العربية            |
| public/assets/     | public/a/      | الصور والأيقونات والشعارات     |

## ✅ أهم السكربتات داخل src/

- `deploy-fix.sh` → نشر تلقائي إلى Firebase وNetlify
- `push-auto.sh` → دفع تلقائي إلى GitHub
- `clean-update.sh` → تنظيف البيئة وتحديث التبعيات
- `init-termux.sh` → تهيئة بيئة Termux آليًا

## 🧪 استخدام سريع في Termux

```bash
unzip sef-final.zip
cd sef/src
bash init-termux.sh
```

ثم:

```bash
npm run dev       # لتشغيل الخادم
npm run deploy    # نشر مزدوج
```

---

🔐 GitHub / Firebase جاهزان للربط حسب الإعدادات السابقة.