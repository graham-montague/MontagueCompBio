# This function calculates the species richness!

calculate_richness <- function(data) {
  # I am using scientific name to find all the different species in each of the files, then I will find the length of that to see how many species they found
  if ("scientificName" %in% names(data)) {
    species_names <- data$scientificName[!is.na(data$scientificName)]
    richness <- length(unique(species_names))
  } else {
    richness <- NA
  }
  
  return(richness)
}