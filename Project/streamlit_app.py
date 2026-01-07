# User Interface which runs the backened logic
import streamlit as st
# it is a UI which takes i/p from users and sends to analyzer(backend logic)
# gives back output to UI 
from analyzer import load_db, analyze_ingredients
# st.set_page_config(page_title="Beauty Product Analyzer", page_icon="💄")

st.title("💄 Beauty Product Ingredient Analyzer")

# Load database
db = load_db("ingredients_db.json")

# User input
email = st.text_input("Enter your email address")
ingredients_input = st.text_area("Enter Ingredients (comma-separated)", "")
skin_type = st.selectbox("Select your skin type", ["Normal", "Dry", "Oily", "Combination", "Sensitive", "Acne-prone"])

if st.button("Analyze"):
    #if not ingredients_input:
        # st.error("Please enter ingredients!")
    if not email or not ingredients_input:
        st.error("Please fill all required fields")
    elif "@" not in email:
        st.error("Please enter a valid email address")
    else:
        ingredients_list = [i.strip() for i in ingredients_input.split(",")]
        result = analyze_ingredients(ingredients_list, db, skin_type)

        st.subheader("Summary")
        # to represent in bold form 
        st.metric("Safety Score", f"{result['summary']['safety_score']}%", delta_color="inverse")
        st.write(f"Average Comedogenic Score: {result['summary']['avg_comedogenic']}")
        st.write(f"Total Ingredients: {result['summary']['total_ingredients']}")

        if result['summary']['flagged_items']:
            st.subheader("⚠️ Flagged Ingredients")
            for item in result['summary']['flagged_items']:
                st.write(f"{item['name']} (Risk: {item['risk']}, Comedogenic: {item['comedogenic']})")

        st.subheader("Ingredient Details")
        st.table(result["details"])
