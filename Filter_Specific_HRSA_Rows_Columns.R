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

# --------------------------------------------------------------------------------------
# STEP 1: Read "Clinical Data" sheets from Excel files for 2019–2023
# --------------------------------------------------------------------------------------
# ✅ Each read_excel() caCn read only one sheet in one excel fiel but not multiple fiels in a folder or multiple sheets in a excelfile
# Here each read excel is calling "Clinical Data" sheet for a specific year.
# ❗ You must specify the correct sheet name that exists in each Excel file.

df_2019 <- read_excel("C:/Users/srive/Downloads/FiveYear_MN_Awardees (7)/2019_MN_Awardees.xlsx", sheet = "2019 MN Clinical Data")
df_2020 <- read_excel("C:/Users/srive/Downloads/FiveYear_MN_Awardees (7)/2020_MN_Awardees.xlsx", sheet = "2020 MN Clinical Data")
df_2021 <- read_excel("C:/Users/srive/Downloads/FiveYear_MN_Awardees (7)/2021_MN_Awardees.xlsx", sheet = "2021 MN Clinical Data")
df_2022 <- read_excel("C:/Users/srive/Downloads/FiveYear_MN_Awardees (7)/2022_MN_Awardees.xlsx", sheet = "2022 MN Clinical Data")
df_2023 <- read_excel("C:/Users/srive/Downloads/FiveYear_MN_Awardees (7)/2023_MN_Awardees.xlsx", sheet = "2023 MN Clinical Data")

# --------------------------------------------------------------------------------------
# STEP 2: Filter rows for a specific Health Center (e.g., "UNIVERSITY OF MINNESOTA")
# --------------------------------------------------------------------------------------
# ✅ Here, we use indexing to extract only the rows where `Health Center Name`
#    matches "UNIVERSITY OF MINNESOTA".
# 🖊️ To change the filter, just replace "UNIVERSITY OF MINNESOTA" with the name you want.

Clinical2019 <- df_2019[df_2019$`Health Center Name` %in% c("UNIVERSITY OF MINNESOTA"), ]
Clinical2020 <- df_2020[df_2020$`Health Center Name` %in% c("UNIVERSITY OF MINNESOTA"), ]
Clinical2021 <- df_2021[df_2021$`Health Center Name` %in% c("UNIVERSITY OF MINNESOTA"), ]
Clinical2022 <- df_2022[df_2022$`Health Center Name` %in% c("UNIVERSITY OF MINNESOTA"), ]
Clinical2023 <- df_2023[df_2023$`Health Center Name` %in% c("UNIVERSITY OF MINNESOTA"), ]

# 👉 NOTE:
# - You can change `"UNIVERSITY OF MINNESOTA"` to any other health center.
# - Or You can also add multiple Health Center Names for filtering. 
# - Make sure the name matches **exactly** as it appears in the Excel file (case & spacing).

# --------------------------------------------------------------------------------------
# STEP 3: Add a `Year` column to each filtered dataset
# --------------------------------------------------------------------------------------
# ✅ This is important to track which year each row came from in the final combined table.

Clinical2019$Year <- "2019"
Clinical2020$Year <- "2020"
Clinical2021$Year <- "2021"
Clinical2022$Year <- "2022"
Clinical2023$Year <- "2023"

# --------------------------------------------------------------------------------------
# STEP 4: Combine all 5 years into one dataset using rbind()
# --------------------------------------------------------------------------------------
# ✅ This vertically stacks all filtered rows from 2019 to 2023 into a single data frame.

UMN_Clinical <- rbind(
  Clinical2019,
  Clinical2020,
  Clinical2021,
  Clinical2022,
  Clinical2023
)

#----------------------------------------------------------------------------------------------
  
# STEP 5: Merge all the dataframes into one new file which has all the Years (2019-2023)
#--------------------------------------------------------------------------------------------- 

UMN_Clinical <- rbind( Clinical2019, Clinical2020, Clinical2021,Clinical2022, Clinical2023)

#Print the final result

print(UMN_Clinical)

#------------------------------------------------------------------------------------------
# STEP 6: Export either in excel or csv format

# Export as CSV
write.csv(UMN_Clinical,
          file = "C:/Users/srive/Downloads/UMN_Clinical_Data_2019_2023.csv",
          row.names = FALSE)

# Export as Excel

write.xlsx(UMN_Clinical,
           file = "C:/Users/srive/Downloads/UMN_Clinical_Data_2019_2023.xlsx",
           overwrite = TRUE)
#----------------------------------------------------------------------------------------------
