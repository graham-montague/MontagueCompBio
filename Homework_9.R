# Homework 9 ---------
# load libraries ----
library(pracma)
library(pryr)
library(devtools)
install_github("ngotelli/upscaler")
help(package="upscaler")
library(upscaler)
library(tidyverse)

# set the main directory where the files are located
directory <- "~/Library/CloudStorage/OneDrive-UniversityofVermont/Vermont/Classwork/2025/Test 2/NEON_count-landbird"

# List all year folders
year_folders <- list.dirs(directory, full.names = TRUE, recursive = FALSE)
?list.dirs()
year_folders
# Create an empty list
countdata <- list()
year_folders[1]

# # use for loops through each year folder
# for (i in 1:10) {
#   setwd(year_folders[i])
#   #some function/read.csv to pull out the countdata dataset
#   x<-read.csv("")
# }

# # use for loops through each year folder
# for (i in 1:10) {
#   setwd(year_folders[i])
#   #some function/read.csv to pull out the countdata dataset
#   x<-read.csv("")
#   #Extract some summary stats from it
#   #output the summary stats through write.table or putting into an empty list that's set beforehand
#   countdata[[i]]<-summarystats
# }

# Set the main directory where the files are located
directory <- "~/Library/CloudStorage/OneDrive-UniversityofVermont/Vermont/Classwork/2025/Test 2/NEON_count-landbird"

# List all year folders
year_folders <- list.dirs(directory, full.names = TRUE, recursive = FALSE)
year_folders

# Create an empty list to store the data
countdata <- list()

# Loop through each year folder
for (i in 1:length(year_folders)) {
  # Set working directory to the current year folder
  setwd(year_folders[i])
  
  # List all files in the current folder
  all_files <- list.files()
  
  # # Find files with "countdata" in their name
  # countdata_file <- all_files[grep("countdata", all_files)]
  
  # 
  countdata <- read.csv(all_files[3])
  
  # user defined fucntions
  
  # If a countdata file is found, read it
  if (length(countdata_file) > 0) {
    # Use the first matching file if multiple exist
    data_file <- countdata_file[1]
    
    # Read the CSV file
    x <- read.csv(data_file)
    
    # Store the dataframe in our list
    countdata[[i]] <- x
    
    # Print information for debugging
    cat("Added data from:", data_file, "in folder:", basename(year_folders[i]), "\n")
  } else {
    cat("No countdata file found in folder:", basename(year_folders[i]), "\n")
  }
}

# Return to the main directory
setwd(directory)

# Check the structure of the collected data
str(countdata)


# use for loops through each year folder
for (i in 1:length(year_folders)) {
  setwd(year_folders[i])

  # List all CSV files in the folder
  csv_files <- list.files(pattern = "\\.csv$")

  # If we have at least 3 files, get the 3rd one (countdata)
  if (length(csv_files) >= 3) {
    countdata_file <- csv_files[3]

    # Check if this is actually a countdata file
    if (grepl("countdata", countdata_file)) {
      cat("Processing", countdata_file, "from folder", basename(year_folders[i]), "\n")

      # Read the CSV file
      current_data <- read.csv(countdata_file)

      # Extract year from the filename
      year <- extract_year(countdata_file)
      if (is.na(year)) {
        year <- paste0("year_", i)  # Fallback if year extraction fails
      }

      # Store the dataframe in our list
      all_countdata[[year]] <- current_data


  #Extract some summary stats from it
  #output the summary stats through write.table or putting into an empty list that's set beforehand
  countdata[[i]]<-summarystats
}


# Need to create 5 user defined functions
# Starting with pseudo-code, generate functions for 1) Cleaning the data for any empty/missing cases, 2) Extract the year from each file name, 3) Calculate Abundance for each year (Total number of individuals found), 4) Calculate Species Richness for each year(Number of unique species found), 5) Run a simple regression model for Species Richness (S) vs. Abundance using data from every year, 6) Generate histograms for both Abundance and Species Richness (S) for every year and store the plots.

    # User defined function for 1) cleaning the data for any empty/missing cases

    # # User defined function for 2) cleaning the data for any empty/missing cases

    # User defined function for 3) cleaning the data for any empty/missing cases

    # User defined function for 4) cleaning the data for any empty/missing cases

    # User defined function for 5) cleaning the data for any empty/missing cases

