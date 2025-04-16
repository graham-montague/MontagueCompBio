# We need to make two histograms- one for abundance and one for species richness

generate_histograms <- function(summary_df, output_dir) {
  # First, we need to make the year a factor so we can actually plot it
  summary_df$Year <- factor(summary_df$Year, levels = sort(unique(summary_df$Year)))
  
  # this is the first histogram- we need to make this one an abundaance histogram
  abundance_hist <- ggplot(summary_df, aes(x = Year, y = Abundance)) +
    geom_bar(stat = "identity", fill = "skyblue", color = "black") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    labs(title = "Bird Abundance by Year",
         x = "Year",
         y = "Abundance (Total Number of Birds)")
  
  # this is the first histogram- we need to make this one a richness histogram
  richness_hist <- ggplot(summary_df, aes(x = Year, y = SpeciesRichness)) +
    geom_bar(stat = "identity", fill = "lightgreen", color = "black") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    labs(title = "Bird Species Richness by Year",
         x = "Year",
         y = "Species Richness (Number of Unique Species)")
  
  # I like using the ggsave to save the plots
  ggsave(file.path(output_dir, "abundance_histogram.png"), abundance_hist, width = 8, height = 6)
  ggsave(file.path(output_dir, "richness_histogram.png"), richness_hist, width = 8, height = 6)
  
  return(list(abundance = abundance_hist, richness = richness_hist))
}
