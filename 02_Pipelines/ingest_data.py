import pandas as pd
import os

# Define file paths
input_file = "D:/Retail Data Engineering project/Data_Lake/Raw/Online Retail.xlsx"
output_file = "D:/Retail Data Engineering project/Data_Lake/Raw/retail_raw.csv"

# Read Excel dataset
df = pd.read_excel(input_file)

# Save as CSV
df.to_csv(output_file, index=False)

print("Data ingestion completed successfully!")