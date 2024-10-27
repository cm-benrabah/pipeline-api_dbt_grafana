import requests
import pandas as pd
import psycopg2
from sqlalchemy import create_engine, text

# 1. Fetch data from CoinGecko API
url = 'https://api.coingecko.com/api/v3/coins/markets'
params = {'vs_currency': 'usd'}
response = requests.get(url, params=params)

# Check if the request was successful
if response.status_code == 200:
    data = response.json()  # The API returns a list of dictionaries
else:
    print(f"Failed to fetch data from API. Status code: {response.status_code}")
    exit()

# 2. Convert data to a Pandas DataFrame
df = pd.DataFrame(data)

# 3. Remove unwanted columns and rename to match the table schema
df = df[[
    'id', 'symbol', 'name', 'image', 'current_price', 'market_cap', 'market_cap_rank',
    'fully_diluted_valuation', 'total_volume', 'high_24h', 'low_24h', 'price_change_24h', 
    'price_change_percentage_24h', 'market_cap_change_24h', 'market_cap_change_percentage_24h', 
    'circulating_supply', 'total_supply', 'max_supply', 'ath', 'ath_change_percentage', 
    'ath_date', 'atl', 'atl_change_percentage', 'atl_date', #'roi', 
    'last_updated' 
]]

# 4. Connect to PostgreSQL using SQLAlchemy with autocommit
try:
    engine = create_engine('postgresql+psycopg2://cm_benrabah:pass@postgres:5432/crypto_db', isolation_level="AUTOCOMMIT")
    print("Successfully connected to the database.")
except Exception as e:
    print(f"Error connecting to the database: {e}")
    exit()

# 5. Check if the table exists and drop it
table_name = 'crypto_data'
with engine.connect() as connection:
    if connection.dialect.has_table(connection, table_name):
        connection.execute(text(f'DROP TABLE IF EXISTS {table_name} CASCADE;'))
        print(f"Table '{table_name}' dropped.")

# 6. Insert DataFrame into PostgreSQL
try:
    df.to_sql(table_name, engine, if_exists='replace', index=False)
    print("Data successfully inserted into the database.")
except Exception as e:
    print(f"Error inserting data into the database: {e}")

# 7. Close the connection
engine.dispose()
print("Database connection closed.")
