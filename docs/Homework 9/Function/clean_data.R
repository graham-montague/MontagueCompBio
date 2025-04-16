# this function cleans the data and is the first function we need

clean_data <- function(data) {
  clean_data <- data
  
  # Standardize missing values across all columns
  clean_data <- as.data.frame(lapply(clean_data, function(x) {
    # We want to make any empty data to be NA throughout the entire dataset!
    ifelse(x %in% c("", "NA", "NULL", "N/A", "na", "null", "n/a") | is.na(x), NA, x)
  }))
  
  # Now we need to remove the data where NA is found throughout the data set
  complete_na_rows <- apply(clean_data, 1, function(x) all(is.na(x)))
  if (any(complete_na_rows)) {
    clean_data <- clean_data[!complete_na_rows, ]
  }
  
  return(clean_data)
}
