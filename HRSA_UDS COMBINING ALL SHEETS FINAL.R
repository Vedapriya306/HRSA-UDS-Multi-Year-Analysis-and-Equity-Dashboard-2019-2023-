install.packages("readxl")     # For reading Excel (.xlsx) files
install.packages("dplyr")      # For data manipulation (e.g., filter, mutate, bind)
install.packages("ggplot2")    # For data visualization (not used in this script but good to have)
install.packages("writexl")    # For writing Excel files (not used here, optional)
install.packages("openxlsx")   # For advanced Excel writing (e.g., multiple sheets)

# Load libraries into your R session
library(readxl)
library(dplyr)
library(ggplot2)
library(writexl)
library(openxlsx)
library(stringr)               # For working with strings (used for detecting sheet names)

#---------------------------------------------------------------------------------------------------
# STEP 1: To loop over each year's file without manually typing every path

# Define the folder where your Excel files are saved
folder_path <- "C:/Users/srive/Downloads/FiveYear_MN_Awardees (7)"

# Define a vector of years
years <- 2019:2023

# Build full file paths like "C:/.../2019_MN_Awardees.xlsx", ..., "2023_MN_Awardees.xlsx"
file_paths <- file.path(folder_path, paste0(years, "_MN_Awardees.xlsx"))

#--------------------------------------------------------------------------------------------

#STEP 2:  Sheet names may not match exactly in each file,so using regex patterns ensures you pick the right sheet 
#Even if there is small name variation (eg: spaces or captial letters)

# Named patterns to look for in each category

sheet_patterns <- list(
  age_ethnicity = "Age.*Race.*Ethnicity",
  patient_characteristics = "Patient.*characteristics",
  clinical_data = "Clinical.*Data",
  cost = "Cost",
  services = "Services"
)

#---------------------------------------------------------------------------------------

#STEP 3: Function to read and combine all sheets matching a given pattern
  
  read_and_combine_sheets <- function(pattern) {
    sheet_data_list <- list()  # Create an empty list to hold yearly data
    
    for (i in seq_along(file_paths)) {
      file <- file_paths[i]
      year <- years[i]
      sheets <- excel_sheets(file)  # List all sheet names in the file
      
      # Find the sheet that matches the given pattern
      target_sheet <- sheets[str_detect(sheets, regex(pattern, ignore_case = TRUE))]
      
      if (length(target_sheet) == 1) {
        # Read that sheet and convert all columns to text to avoid type mismatch
        df <- read_excel(file, sheet = target_sheet, col_types = "text")
        df$year <- as.character(year)  # Add year column
        sheet_data_list[[as.character(year)]] <- df  # Save in the list
      }
    }
    
    # Combine all data frames in the list into one
    bind_rows(sheet_data_list)
  }
#--------------------------------------------------------------------------------------------------
  
# STEP 5: Read and combine sheets for each category from all excel fiels
  
  # This step pulls the data out of Excel for each year, combines the same sheet 
  # across years, and adds a 'year' column so you know where each row came from.
  
df_age_ethnicity <- read_and_combine_sheets(sheet_patterns$age_ethnicity)
df_patient_characteristics <- read_and_combine_sheets(sheet_patterns$patient_characteristics)
df_clinical_data <- read_and_combine_sheets(sheet_patterns$clinical_data)
df_cost <- read_and_combine_sheets(sheet_patterns$cost)
df_services <- read_and_combine_sheets(sheet_patterns$services)

#---------------------------------------------------------------------------------------------------------
  
#STEP 6: Add a category column to each dataset
#This step tags each dataset with a category label so that when all datasets
# are merged into a single CSV file, you can easily filter and analyze by category in Tableau.
# Without this step, you'd lose context about which row came from which sheet type.

df_age_ethnicity$category <- "Age and Race-Ethnicity"
df_patient_characteristics$category <- "Patient Characteristics"
df_clinical_data$category <- "Clinical Data"
df_cost$category <- "Cost"
df_services$category <- "Services"

#-----------------------------------------------------------------------------------------------------
  
# STEP 7: Combine all into one long CSV (Tableau-friendly) and Export
  
HRSA_combined <- bind_rows(
  df_age_ethnicity,
  df_patient_characteristics,
  df_clinical_data,
  df_cost,
  df_services
)

# Export
write.csv(HRSA_combined, 
          file = "C:/Users/srive/Downloads/HRSA_All_Categories_Combined.csv", 
          row.names = FALSE)




















