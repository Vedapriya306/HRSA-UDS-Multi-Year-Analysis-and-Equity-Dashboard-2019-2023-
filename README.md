 HRSA UDS Data Processing & Tableau Dashboard
🏥 What is HRSA UDS?
The Health Resources and Services Administration (HRSA) collects Uniform Data System (UDS) data annually from health centers funded under the Health Center Program. UDS data includes:

Patient demographics

Clinical quality measures

Service utilization

Costs and financial performance

This data is critical for evaluating the performance of Federally Qualified Health Centers (FQHCs) and informing public health decisions at the local and national levels.

📌 Project Goal
This project focuses on extracting and transforming HRSA UDS Excel files from 2019 to 2023 for streamlined, multi-year analysis. The primary goals were:

Combine data from 5 separate Excel files (each representing a year) into one long-format Excel/CSV.

Add contextual columns like year and category to make data Tableau-ready.

Create an interactive Tableau dashboard to explore trends across time, health centers, and clinical categories.

🧩 What I Did
✅ File 1: Combined Dataset for Tableau
Filename: HRSA_All_Categories_Combined.csv / HRSA_All_Categories_Combined.xlsx

What it contains:

Combined data from the following sheets:

Age and Race-Ethnicity

Patient Characteristics

Clinical Data

Cost

Services

Columns year and category added to track source and enable filtering.

Use: Ideal for import into Tableau for multi-year analysis and category-based exploration.

✅ File 2: Filtered Data for Specific Health Center (UNIVERSITY OF MINNESOTA)
Filename: UMN_Clinical_Data_2019_2023.csv / UMN_Clinical_Data_2019_2023.xlsx

What it contains:

Only rows where Health Center Name == "UNIVERSITY OF MINNESOTA"

Pulled from the "Clinical Data" sheet of each Excel file

Includes a Year column to track time-based data

Use: Useful for longitudinal analysis of a single center's clinical performance.

📂 Scripts Included
Script Name	Purpose
combine_hrsa_data_all_years.R	Reads all 5 Excel files, extracts 5 key sheets, adds year and category, and combines them into a single long-format file for Tableau.
filter_specific_rows_from_excel_files.R	Filters one specific sheet (e.g., "Clinical Data") from each year’s file for a specified health center name (e.g., "UNIVERSITY OF MINNESOTA") and combines it.
