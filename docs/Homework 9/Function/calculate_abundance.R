# We need to make a function to caluclate the abundance

calculate_abundance <- function(data) {
  # I am using clusterSize to include the abundance for each file
  if ("clusterSize" %in% names(data)) {
    abundance <- sum(data$clusterSize, na.rm = TRUE)
  } else {
    abundance <- nrow(data)  # Use this in case cluster size does not work
  }
  
  return(abundance)
}