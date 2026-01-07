# Backend Logic
import json

def load_db(file_path):
    with open(file_path, "r") as f:
        return json.load(f)

def analyze_ingredients(ingredients_list, db, skin_type):
    flagged = []
    total_comed = 0
    details = []
# here db is the variable, which is a database in streamlite connection
# dont get confused
    for ing_name in ingredients_list:
        # dictonary mathod d.get(key,defaul_values)
        ing_data = db.get(ing_name.strip().lower(), {
            "category": "Unknown",
            "benefits": "No data",
            "risk": "Unknown",
            "comedogenic": 0
        })

        if ing_data['risk'] in ["Medium", "High"]:
            flagged.append({
                "name": ing_name,
                "risk": ing_data['risk'],
                "comedogenic": ing_data['comedogenic']
            })

        total_comed += ing_data['comedogenic']
        details.append({
            "Ingredient": ing_name,
            "Category": ing_data['category'],
            "Benefits": ing_data['benefits'],
            "Risk": ing_data['risk'],
            "Comedogenic": ing_data['comedogenic']
        })
# come out of the loop 
    avg_comed = round(total_comed / len(ingredients_list), 2) if ingredients_list else 0
    safety_score = calculate_safety(ingredients_list, db, skin_type)

    return {
        "summary": {
            "avg_comedogenic": avg_comed,
            "safety_score": safety_score,
            "total_ingredients": len(ingredients_list),
            "flagged_items": flagged
        },
        "details": details
    }

def calculate_safety(ingredients_list, db, skin_type):
    score = 0
    for ing_name in ingredients_list:
        ing = db.get(ing_name.strip().lower(), {"risk": "Low", "comedogenic": 0})
        risk = ing.get("risk", "Low")
        comed = ing.get("comedogenic", 0)

        if skin_type == "Oily":
            score += comed * 2
            if risk in ["Medium", "High"]:
                score += 2
        elif skin_type == "Dry":
            score += comed
            if risk == "High":
                score += 2
        elif skin_type == "Sensitive":
            if risk in ["High", "Medium"]:
                score += 3
        elif skin_type == "Normal":
            score += comed
        else:  # Combination
            score += comed + (1 if risk == "Medium" else 0)

    max_score = len(ingredients_list) * 5
    safety = max(0, 100 - int(score / max_score * 100))
    return safety
