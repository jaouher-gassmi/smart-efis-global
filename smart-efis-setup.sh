#!/data/data/com.termux/files/usr/bin/bash

cd ~
mkdir -p smart-efis-global/public/en
mkdir -p smart-efis-global/public/ar
mkdir -p smart-efis-global/assets
mkdir -p smart-efis-global/functions
mkdir -p smart-efis-global/tools

# إنشاء صفحات HTML للغات
cat <<'EOF' > ~/smart-efis-global/public/en/index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Smart EFIS</title>
  </head>
  <body>
    <h1>Welcome to Smart EFIS (EN)</h1>
  </body>
</html>
EOF

cat <<'EOF' > ~/smart-efis-global/public/ar/index.html
<!DOCTYPE html>
<html lang="ar" dir="rtl">
  <head>
    <meta charset="UTF-8">
    <title>نظام الطيران الذكي</title>
  </head>
  <body>
    <h1>مرحبًا بك في نظام Smart EFIS (AR)</h1>
  </body>
</html>
EOF

# إنشاء firebase.json مع توزيع ذكي
cat <<'EOF' > ~/smart-efis-global/firebase.json
{
  "hosting": [
    {
      "target": "en",
      "public": "public/en",
      "ignore": ["firebase.json", "**/.*", "**/node_modules/**", "**/storage/**", "../storage/**", "../../storage/**"],
      "rewrites": [{ "source": "**", "destination": "/index.html" }]
    },
    {
      "target": "ar",
      "public": "public/ar",
      "ignore": ["firebase.json", "**/.*", "**/node_modules/**", "**/storage/**", "../storage/**", "../../storage/**"],
      "rewrites": [{ "source": "**", "destination": "/index.html" }]
    }
  ]
}
EOF
