from typing import List, Dict
from datetime import datetime
import json

# تحميل البيانات من ملف JSON
with open("data.json", "r") as file:
    data: List[Dict] = json.load(file)

def get_best_versions(data: List[Dict], key: str = "id", priority: str = "score") -> List[Dict]:
    latest_versions = {}
    
    for item in data:
        unique_key = item[key]
        current = latest_versions.get(unique_key)
        
        if priority == "date":
            item_date = datetime.strptime(item["date"], "%Y-%m-%d")
            current_date = datetime.strptime(current["date"], "%Y-%m-%d") if current else None
            if current is None or item_date > current_date:
                latest_versions[unique_key] = item
        
        elif priority == "score":
            if current is None or item["score"] > current["score"]:
                latest_versions[unique_key] = item
        
        elif priority == "version":
            if current is None or item["version"] > current["version"]:
                latest_versions[unique_key] = item

    return list(latest_versions.values())

# تغيير هذا السطر لتحديد معيار الفرز: "score" أو "date" أو "version"
priority = "score"

filtered = get_best_versions(data, priority=priority)

# حفظ النتيجة في ملف جديد
with open("cleaned_data.json", "w") as outfile:
    json.dump(filtered, outfile, indent=2)

print(f"✅ تم تنظيف البيانات وحفظها في cleaned_data.json (حسب: {priority})")
