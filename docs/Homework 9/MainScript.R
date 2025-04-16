# Homework 9 ---------
# MainScript.R for NEON Bird Data Analysis
library(pracma)
library(pryr)
library(devtools)
install_github("ngotelli/upscaler")
help(package="upscaler")
library(upscaler)
library(tidyverse)

# add_folder("Function")

# I need to make a directory for all of the files
project_dir <- "~/Library/CloudStorage/OneDrive-UniversityofVermont/Vermont/Classwork/2025/CompBio/Homework 9"
data_dir <- file.path(project_dir, "NEON_count-landbird")
function_dir <- file.path(project_dir, "Function")
output_dir <- file.path(project_dir, "Output")

# # Create output directory if it doesn't exist
# if (!dir.exists(output_dir)) {
#   dir.create(output_dir, recursive = TRUE)
# }

# Set up log file for Homework 9
log_file <- file.path(output_dir, "analysis_log.txt")
log_conn <- file(log_file, "w")
cat("NEON Bird Data Analysis Log\n", file = log_conn)
cat("Date: ", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n\n", file = log_conn)

# Get the function files from the function folder
source(file.path(function_dir, "clean_data.R"))
source(file.path(function_dir, "extract_year.R"))
source(file.path(function_dir, "calculate_abundance.R"))
source(file.path(function_dir, "calculate_richness.R"))
source(file.path(function_dir, "run_regression.R"))
source(file.path(function_dir, "generate_histograms.R"))

# Make a blank dataframe where we will put all of the results for our bird files
summary_df <- data.frame(
  FileName = character(),
  Year = character(),
  Abundance = numeric(),
  SpeciesRichness = numeric(),
  stringsAsFactors = FALSE
)

# Need to create a list for all of the years
year_folders <- list.dirs(data_dir, full.names = TRUE, recursive = FALSE)
cat("Found", length(year_folders), "year folders\n", file = log_conn)

# Now we need to create a for loop to run through each of the files in our Neon bird data
for (i in 1:length(year_folders)) {
  # This set the working directory to the current year
  setwd(year_folders[i])
  
  # this creates a list of all of the files
  all_files <- list.files()
  
  # I am using the grep function to find the file that I need- the countdata files
  countdata_file <- all_files[grep("countdata", all_files)]
  
  # If this finds the file, then we can actually use it
  if (length(countdata_file) > 0) {
    data_file <- countdata_file[1]
    
    # This adds a log message in our output for Homework 9
    cat("Processing:", data_file, "from folder:", basename(year_folders[i]), "\n", file = log_conn)
    
    # Now we can read in the csv file
    raw_data <- read.csv(data_file)
    
    # First function in our user defined functions in the functions files that cleans our data. We also want to make another data frame that we use for the other user defined functions
    cleaned_data <- clean_data(raw_data)
    
    # Now this user defined function extracts the year from the files
    year <- extract_year(data_file)
    
    # this is another user defined function that calculates abundance from our files
    abundance <- calculate_abundance(cleaned_data)
    
    # this is another user defined function that calculates richness from our files
    richness <- calculate_richness(cleaned_data)
    
    # After I calculated all of the metrics that we need to calculate, then we need to add them to the summary data frame
    summary_df <- rbind(summary_df, data.frame(
      FileName = data_file,
      Year = year,
      Abundance = abundance,
      SpeciesRichness = richness
    ))
    
    cat("  Abundance:", abundance, "Species Richness:", richness, "\n", file = log_conn)
  } else {
    cat("No countdata file found in folder:", basename(year_folders[i]), "\n", file = log_conn)
  }
}

# End of for loop!

# Now we need to go back to our starting directory to run the regression and make some histograms
setwd(project_dir)

# now we need to run the user defined function that allows us to run the regression analysis
regression_stats <- run_regression(summary_df)

# this makes a csv file of the summary stats the at we look at
write.csv(summary_df, file.path(output_dir, "bird_data_summary.csv"), row.names = FALSE)
cat("Saved the output as bird_data_summary.csv\n", file = log_conn)

# This writes the regression statisitics from our regression analysis 
write.csv(regression_stats, file.path(output_dir, "regression_statistics.csv"), row.names = FALSE)
cat("saved regression to the output regression_statistics.csv\n", file = log_conn)

# Now we need to make some histograms from summary_df and save this to the log
histograms <- generate_histograms(summary_df, output_dir)
cat("we made histograms and saved them\n", file = log_conn)

# End the log file for Homework 9
cat("\nDone with Analysis: ", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n", file = log_conn)
close(log_conn)

# Show the log in the console!
cat("Done with Analysis", output_dir, "\n")
    
    