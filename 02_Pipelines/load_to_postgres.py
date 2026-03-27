import os
import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Retrieve PostgreSQL credentials from environment variables
username = os.getenv("DB_USERNAME")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")
database = os.getenv("DB_DATABASE")

# Path to the processed dataset in the data lake
file_path = "D:/Retail Data Engineering project/01_Data_Lake/Processed/retail_clean.csv"

# Load the processed CSV into a pandas DataFrame
df = pd.read_csv(file_path)

# Create SQLAlchemy engine for PostgreSQL connection
engine = create_engine(
    f'postgresql://{username}:{password}@{host}:{port}/{database}'
)

# Load dataframe into PostgreSQL table
# if_exists="replace" recreates the table each run
df.to_sql(
    "sales_raw",
    engine,
    schema="retail",
    if_exists="replace",
    index=False
)

print("Data loaded into PostgreSQL successfully!")