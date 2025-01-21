import pandas as pd

# Load the CSV file
df = pd.read_csv(r"C:\Users\MY PC\OneDrive\文档\Data Analyst\PROJECT\Gencafe\sales_dataset\sales_data.csv")

# Check info for the DataFrame
print("Data Info:")
print(df.info())

print("Data Description")
print(df.describe())

# Check for duplicate rows
duplicates = df[df.duplicated()]
print("Duplicate Rows:")
print(duplicates)

# Remove duplicates and keep the first occurrence
df_cleaned = df.drop_duplicates()

# Save the cleaned data to a new file (use .csv for CSV format)
df_cleaned.to_csv(r"C:\Users\MY PC\OneDrive\文档\Data Analyst\PROJECT\Gencafe\sales_dataset\sales_data.csv", index=False)



