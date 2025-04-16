# this user defined function extracts the year from the data file

extract_year <- function(filename) {
  # I am doing this by looking for the year within the title of the filename. The first 4 digits represent the year for each of the bird count data
  pattern <- "brd_countdata\\.(\\d{4})(\\d{2})"
  
  # Now I need to use a regular expression to match the filenames
  year_match <- regmatches(filename, regexec(pattern, filename))
  
  # Let's see if we found a mathc.
  if (length(year_match) > 0 && length(year_match[[1]]) >= 2) {
    # now the year is matched 
    year <- year_match[[1]][2]
    return(year)
  } else {
    # this is an alternative method that looks for the "20" followed by the year. I will use this if it fails...
    fallback_match <- regexpr("20[0-9]{2}", filename)
    if (fallback_match > 0) {
      year <- substr(filename, fallback_match, fallback_match + 3)
      return(year)
    } else {
      return(NA)
    }
  }
}
