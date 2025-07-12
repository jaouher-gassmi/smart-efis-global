#!/data/data/com.termux/files/usr/bin/bash

echo "📨 إضافة اقتراح جديد إلى Smart EFIS Global"
read -p "العنوان: " title
read -p "النوع (ميزة / تصحيح / تكامل / أمان): " type
read -p "مقدم الاقتراح: " author

id=$(date +%s | cut -c6-10)
date_now=$(date +%Y-%m-%d)

json_entry=$(cat <<EOF
{
  "id": "$id",
  "title": "$title",
  "type": "$type",
  "status": "قيد الدراسة",
  "created_by": "$author",
  "date": "$date_now"
}
EOF
)

# إدراج إلى الملف JSON
if [ -f proposals/proposal-review.json ]; then
  tmp=$(mktemp)
  jq ".proposals += [$json_entry]" proposals/proposal-review.json > $tmp && mv $tmp proposals/proposal-review.json
  echo "✅ تم حفظ الاقتراح ($title)"
else
  echo "❌ لم يتم العثور على الملف proposals/proposal-review.json"
fi
