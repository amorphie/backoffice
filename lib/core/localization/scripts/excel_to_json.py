import pandas as pd
import json

INPUT_FILE="OnMobil-Revamp-Localization.xlsx"
OUTPUT_FILE="../../../../assets/json/localization_data.json"
DATA_KEY_COLUMN="AUTO-GENERATED KEY"
LANGUAGE_COLUMNS=["VALUE_TR", "VALUE_EN"]

def generateJson(input_file, output_file, data_key_column, language_columns):
    xls = pd.ExcelFile(input_file)
    sheet_names = xls.sheet_names[1:]  # Ignore the first "Guide" sheet
    data_dict = {}

    for sheet_name in sheet_names:
        columns_to_read = [data_key_column] + language_columns
        data_file = pd.read_excel(xls, sheet_name, usecols=columns_to_read)

        for column in language_columns:
            data_file[column] = data_file[column].apply(lambda x: None if pd.isna(x) else x)  # Replace NaN with None for language columns
            data_file[column] = data_file[column].apply(lambda x: x.strip() if isinstance(x, str) else x) # Remove trailing spaces

        for index, row in data_file.iterrows():
            key = row[data_key_column]
            language_values = {col.replace("VALUE_", ""): row[col] for col in language_columns}
            data_dict[key] = language_values

    with open(output_file, 'w', encoding='utf-8') as json_file:
        json.dump(data_dict, json_file, ensure_ascii=False, indent=2)

generateJson(
    input_file=INPUT_FILE,
    output_file=OUTPUT_FILE,
    data_key_column=DATA_KEY_COLUMN,
    language_columns=LANGUAGE_COLUMNS
)
