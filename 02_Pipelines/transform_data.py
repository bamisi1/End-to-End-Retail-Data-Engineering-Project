import pandas as pd

# File paths
input_file = "D:/Retail Data Engineering project/Data_Lake/Raw/retail_raw.csv"
output_file = "D:/Retail Data Engineering project/Data_Lake/Processed/retail_clean.csv"

# Load raw dataset
df = pd.read_csv(input_file)

#Standardize column names
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

print("Initial dataset shape:", df.shape)

# Remove rows where customerid is missing
df = df.dropna(subset=['customerid'])

# Remove cancelled orders (negative quantity)
df = df[df['quantity'] > 0]

# Remove rows with negative prices
df = df[df['unitprice'] > 0]

# Convert InvoiceDate to datetime
df['invoicedate'] = pd.to_datetime(df['invoicedate'])

# Create revenue column
df['revenue'] = df['quantity'] * df['unitprice']

print("Clean dataset shape:", df.shape)

# Save processed data
df.to_csv(output_file, index=False)

print("Data transformation completed successfully!")