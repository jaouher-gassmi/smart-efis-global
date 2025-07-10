import json
from datetime import datetime
from pathlib import Path

# 🔄 تحميل البيانات
data_file = Path.home() / "smart-efis-global/data/data.json"
with data_file.open() as f:
    data = json.load(f)

def get_best_versions(data, key="id", priority="score"):
    latest = {}
    for item in data:
        uid = item[key]
        if uid not in latest:
            latest[uid] = item
        else:
            current = latest[uid]
            if priority == "score":
                if item["score"] > current["score"]:
                    latest[uid] = item
            elif priority == "date":
                d1 = datetime.strptime(item["date"], "%Y-%m-%d")
                d2 = datetime.strptime(current["date"], "%Y-%m-%d")
                if d1 > d2:
                    latest[uid] = item
    return list(latest.values())

# ⚙️ فلترة حسب الأعلى تقييمًا
cleaned = get_best_versions(data)

# 💾 حفظ الناتج
output_path = Path.home() / "smart-efis-global/cleaned/cleaned_data.json"
with output_path.open("w") as f:
    json.dump(cleaned, f, indent=2)

print("✅ تمت المعالجة بنجاح.")
