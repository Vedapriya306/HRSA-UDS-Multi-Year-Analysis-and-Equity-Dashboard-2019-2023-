# 📊 HRSA UDS Multi-Year Analysis (2019–2023)

This project processes and visualizes data from the **Health Resources and Services Administration (HRSA) Uniform Data System (UDS)** across five years (2019–2023). It includes R scripts to transform and combine data into a Tableau-friendly format, with an interactive dashboard available on Tableau Public.

---

## 🏥 What is HRSA UDS?

The **Uniform Data System (UDS)** is a core reporting requirement for HRSA-funded health centers, containing detailed information on:

- Patient demographics (age, race, ethnicity)
- Clinical quality measures
- Service utilization
- Financial performance

This data is essential for public health evaluation, funding decisions, and improving healthcare access across the U.S.

---

## 📁 Project Outputs

### ✅ 1. Combined Dataset for Tableau

- **File Name:** `HRSA_All_Categories_Combined.csv` and `.xlsx`
- **Description:**  
  Combines five key sheets across all five years:
  - Age and Race-Ethnicity  
  - Patient Characteristics  
  - Clinical Data  
  - Cost  
  - Services
- **Added Columns:**
  - `year` – indicating the year of the source file
  - `category` – indicating which sheet the data came from
- **Purpose:** Ready for Tableau import (long format), supports year-over-year and category-based visualizations.

---

### ✅ 2. Filtered File for Specific Health Center

- **File Name:** `UMN_Clinical_Data_2019_2023.csv` and `.xlsx`
- **Description:**  
  Extracts only the `"Clinical Data"` rows for the health center **"UNIVERSITY OF MINNESOTA"** across 2019–2023.
- **Added Column:** `Year` – for temporal analysis
- **Use Case:** Longitudinal tracking of one health center's clinical performance.

---

## 🔧 R Scripts

| Script Name                              | Description |
|------------------------------------------|-------------|
| `HRSA_UDS_COMBINING_ALL_SHEETS.R`          | Combines all five Excel files and sheets into a single long-format dataset with `year` and `category` columns. Ideal for Tableau or Power BI. |
| `filter_specific_rows_from_excel_files.R`| Filters a specific sheet (e.g., "Clinical Data") by health center name (e.g., `"UNIVERSITY OF MINNESOTA"`) and combines matching rows from all years into one file. |

> 💡 Replace the health center name inside the script to extract data for any other center.

---

## 📈 Live Tableau Dashboard

View the interactive dashboard here:  
🔗 [HRSA UDS Tableau Dashboard](https://public.tableau.com/app/profile/yourusername/viz/hrsa-dashboard/Overview)
