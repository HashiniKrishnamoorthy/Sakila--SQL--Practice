# 💄 Beauty Product Ingredient Analyzer

## Overview
The **Beauty Product Ingredient Analyzer** is a web application built using **Python**, **Streamlit**, and **pandas** that helps users analyze skincare and cosmetic product ingredients.  
It evaluates ingredients for **safety**, **comedogenicity**, **skin type compatibility**, and flags potential **high-risk components**.  

Ideal for skincare enthusiasts, dermatologists, cosmetic formulators, and anyone wanting **data-driven decisions for skin health**.  

#### NOTE:
 #### Remember this project is only at the base level, if we want to use it production level, it needs lot of hard work for getting ingredient list and research also need to be done 
---

## Features
- Analyze ingredients from any cosmetic or skincare product  
- Calculate **average comedogenic score** for all ingredients  
- Generate a **safety score** based on skin type  
- Flag ingredients with **Medium/High risk** for sensitive or acne-prone skin  
- Provide detailed ingredient insights: **Category, Benefits, Risk, Comedogenic score**  
- Support for multiple skin types: **Normal, Dry, Oily, Combination, Sensitive, Acne-prone**  

---

## Technology Stack
- **Python 3.10+** – backend logic and analysis  
- **Streamlit** – interactive web interface  
- **pandas & NumPy** – data manipulation and calculations  
- **JSON** – ingredient database  
- **Secure SMTP** – optional for email reports, to do in virtual world to professional send the reports

---

## Project Structure

### beauty-product-analyzer/
- analyzer.py # Backend logic for ingredient analysis
- ingredients_db.json # JSON database of ingredients
- app.py # Streamlit front-end code
- requirements.txt # Python dependencies
- README.md # Project documentation


- **`analyzer.py`** – Handles loading the ingredient database, computing safety and comedogenic scores, and preparing results for display.  
- **`ingredients_db.json`** – Contains all ingredient data in structured JSON format. Fields include:(I am done this by using Chatgpt to generate this JSON file)
  - `category` (e.g., humectant, oil, active, etc.)
  - `benefits` (key advantages of the ingredient)
  - `risk` (possible side effects or irritation)
  - `comedogenic` (score from 0–5 indicating pore-clogging potential)
- **`app.py`** – Streamlit application that takes user input, interacts with the analyzer, and presents results in a clean UI.  
- **`requirements.txt`** – Contains all Python dependencies needed to run the project.

---

##  Installation

Follow these steps to set up the project locally:

1. **Clone the repository:**
```bash
git clone https://github.com/yourusername/beauty-product-analyzer.git
cd beauty-product-analyzer
```

2. **Create a virtual environment (recommended):**
```bash
python -m venv venv
# Activate environment:
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows
```
3. **Install dependencies:**
 ```bash
   pip install -r requirements.txt
 ```
5. **Run the Streamlit application:**
```bash
streamlit run app.py
```

---
## Usage

- Open the application in your browser (Streamlit will automatically provide a localhost URL).
- Enter the ingredients of your product in the text area, separated by commas.
- Select your skin type from the dropdown menu.
- Click Analyze to generate a report.

## Output Includes:

- Safety Score (%) – Percentage indicating overall safety of the product based on ingredient risks.
- Average Comedogenic Score – Helps identify pore-clogging potential.
- Flagged Ingredients – Ingredients that may cause irritation or are highly comedogenic.
- Detailed Table – Lists all ingredients with category, benefits, risk level, and comedogenic score.

### Example
#### Input:
```bash
Niacinamide, Hyaluronic Acid, Shea Butter, Coconut Oil, Retinol
```
#### Output
Here I need to mention one infoirmation about the **risk** and **Flagged ingredients**, whatevere you have done in your json file will be showing here , in my json file i have done it differently based on all skin types
| Metric                    | Value                                                                                                                                                      |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Safety Score              | 78%                                                                                                                                                        |
| Average Comedogenic Score | 1.8                                                                                                                                                        |
| Flagged Ingredients       | Coconut Oil (Risk: Highly comedogenic, Comedogenic: 4), Shea Butter (Risk: May clog pores, Comedogenic: 2), Retinol (High irritation risk, Comedogenic: 1) |

And remaining table of ingredients with the 

| Ingredient      | Category  | Benefits                          | Risk                 | Comedogenic Score |
| --------------- | --------- | --------------------------------- | -------------------- | ----------------- |
| Niacinamide     | Active    | Brightening, reduces inflammation | Low                  | 0                 |
| Hyaluronic Acid | Humectant | Deep hydration                    | Very Low             | 0                 |
| Shea Butter     | Emollient | Moisturizes deeply                | May clog pores       | 2                 |
| Coconut Oil     | Oil       | Hydrating                         | Highly comedogenic   | 4                 |
| Retinol         | Active    | Anti-aging, improves texture      | High irritation risk | 1                 |
