import pandas as pd
from sqlalchemy import create_engine

# Step 1: Load cleaned dataset
df = pd.read_csv('../data/cleaned.csv')

# Step 2: Connect to PostgreSQL
engine = create_engine('postgresql://postgres:1121@localhost:5432/insurance_db')

# Step 3: Upload data to database
df.to_sql('claims', engine, if_exists='replace', index=False)

print("Data uploaded successfully")