import pandas as pd

# File paths
input_path = "C:/Users/pc576/Documents/used_car_listings.csv"
output_path = "C:/Users/pc576/Documents/cleaned_output.csv"

# Load the CSV
df = pd.read_csv(input_path, encoding='utf-8', on_bad_lines='skip')

# Drop duplicate rows
df = df.drop_duplicates()

# Remove non-ASCII/UTF-8 characters from all string columns
for col in df.select_dtypes(include='object'):
    df[col] = df[col].apply(lambda x: x.encode('utf-8', 'ignore').decode('utf-8') if isinstance(x, str) else x)

# Replace clearly invalid entries (e.g. text in date columns) with NaN
df['posting_date'] = pd.to_datetime(df['posting_date'], errors='coerce')

# Save cleaned file
df.to_csv(output_path, index=False)

print("✅ Cleaning complete. File saved to:", output_path)
